//===-- SafeRegion.cpp - Example Transformations --------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/Utils/SafeRegion.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/InitializePasses.h"
#include "llvm/Support/Casting.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Transforms/Utils/PromoteMemToReg.h"
#include "llvm/IR/Type.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IntrinsicsRISCV.h"

#include <map>
#include <vector>

using namespace llvm;
using namespace std;

enum VariableType{
  INTEGER,
  DOUBLE,
  LONG,
  CHAR,
  STRING,
  ARRAY,
  FLOAT,
  STRUCT, //same as a class
  VOID,
  POINTER,
  UNKNOWN
};

//location of variable in memory
enum MemoryLocation{
  STACK,
  HEAP,
  GLOBAL,
  LOCAL
};

//struct to be used to collect all the variables in a file
struct Variables{
  VariableType type;            //type of variable
  long size;              //size of variable in bytes
  bool isStatic;          //can all(most) info be refered at run time
  MemoryLocation memLoc;  //location of the memory
};

//data structure to be used to hold all the variables in a file
map<llvm::Instruction*, vector<Variables>> allVariables;

//data structure to be used to hold all the instructions that use a variable
map<llvm::Instruction*, vector<llvm::Instruction*>> allInstructions;

/*
function to use to get the type of variable
in the form of a string
*/
VariableType getVariableType(Type* var, GlobalVariable* tmpInstruction){

    //get the type
    if(var->isIntegerTy()){
      //get the type of integer
      IntegerType* integer = (llvm::IntegerType*) var;
      if(integer->getBitWidth() == 8)
        return VariableType::CHAR;
      else if(integer->getBitWidth() == 64)
        return VariableType::LONG;
      else{
        if(tmpInstruction){
          //check if the global value is initialized with a constant
          if(tmpInstruction->isConstant() || tmpInstruction->hasInitializer()) {   
            //check if it is a by string (char array)         
            if(dyn_cast<ConstantDataArray>(tmpInstruction->getInitializer()))
              return VariableType::ARRAY;
            else{
              //if it is an integer
              if(integer->getBitWidth() == 32)
                return VariableType::INTEGER;
              else{
                //assert(false); 
              }          
            }
          }
          else if(integer->getBitWidth() == 32)
            return VariableType::INTEGER;
          else{
            assert(false);
          }
        }
        else{
          //if it is an integer
          if(integer->getBitWidth() == 32)
            return VariableType::INTEGER;
          else
            assert(false);   //check which type of variable you missed
        } 

      }
    }
    else if(var->isFloatTy())
      return VariableType::FLOAT;
    else if(var->isDoubleTy())
      return VariableType::DOUBLE;
    else if(var->isStructTy())
      return VariableType::STRUCT;
    else if(var->isVoidTy()) //void type with no size
      return VariableType::VOID;
    else if(var->isArrayTy())
      return VariableType::ARRAY;
    else if(var->isPointerTy())
      return VariableType::POINTER;

    return VariableType::UNKNOWN;
}

long getIntegerVariableSize(IntegerType* integer, GlobalVariable* tmpInstruction) {
    if (tmpInstruction){
      if(tmpInstruction->isConstant() || tmpInstruction->hasInitializer()) {
        if (ConstantDataArray* arrayInitializer = dyn_cast<ConstantDataArray>(tmpInstruction->getInitializer())) {
            unsigned int bitWidth = arrayInitializer->getElementType()->getIntegerBitWidth();
            unsigned int arraySize = arrayInitializer->getNumElements() * bitWidth / 8;
            return arraySize;
        }
        else {
            return integer->getBitWidth() / 8;          
        }
      }
    }
    else {
        return integer->getBitWidth() / 8;
    }

    return 0;
}

long getVariableSize(Type* var, GlobalVariable* tmpInstruction) {

    //size of value (use if necessary)
    int size = 0;

    if (var->isIntegerTy()) {
        IntegerType *integer = dyn_cast<IntegerType>(var);
        return getIntegerVariableSize(integer, tmpInstruction);
    }
    else if (var->isFloatTy()) {
        return var->getScalarSizeInBits() / 8;
    }
    else if (var->isDoubleTy()) {
        return var->getScalarSizeInBits() / 8;
    }
    else if (var->isArrayTy()) {
      ArrayType *arr = dyn_cast<ArrayType>(var);

      auto *elemType = arr->getElementType();

      unsigned int bitWidth = elemType->getScalarSizeInBits();
      unsigned int arraySize = arr->getNumElements() * bitWidth / 8;
      return arraySize;
    }
    else if (var->isPointerTy()) {
      //PointerType *ptr = dyn_cast<PointerType>(var);
    }
    if(var->isStructTy()){
      StructType* structVar = dyn_cast<StructType>(var);
      //iterate the struct
      for(auto *elem = structVar->element_begin(); elem != structVar->element_end(); ++elem){
        //errs() << "  size : "<< *(*elem)<<"\n";
        Type* type = nullptr;
        type = static_cast<Type*>(*elem);
        // errs() << "  type size : " << *type<< "\n";
        size = size + getVariableSize(type, tmpInstruction);
      }
    }
    
    return size;
}

void printVariable(Variables var){
  
  errs()<< "    Type: "; 
  switch (var.type){
    case VariableType::INTEGER:
      errs()<<"INTEGER\n";
      break;
    case VariableType::DOUBLE:
      errs()<<"DOUBLE\n";
      break;      
    case VariableType::LONG:
      errs()<<"LONG\n";
      break;
    case VariableType::CHAR:
      errs()<<"CHAR\n";
      break;
    case VariableType::STRING:
      errs()<<"STRING\n";
      break;
    case VariableType::ARRAY:
      errs()<<"ARRAY\n";
      break;
    case VariableType::FLOAT:
      errs()<<"FLOAT\n";
      break;
    case VariableType::STRUCT:
      errs()<<"STRUCT\n";
      break;
    case VariableType::VOID:
      errs()<<"VOID\n";
      break;
    case VariableType::POINTER:
      errs()<<"POINTER\n";
      break;
    case VariableType::UNKNOWN:
      errs()<<"UNKNOWN\n";
      break;
    default:
      //should not happen
      assert(false);
  }
  errs() << "    Size: "<< var.size << " Bytes"<< "\n"; 
  errs() << "    Static: "<< var.isStatic << "\n"; 
  errs() << "    Memory Location: ";
  switch (var.memLoc){
    case MemoryLocation::STACK:
      errs() << "STACK\n";
      break;
    case MemoryLocation::HEAP:
      errs() << "HEAP\n";
      break;
    case MemoryLocation::GLOBAL:
      errs() << "GLOBAL\n";
      break;
    case MemoryLocation::LOCAL:
      errs() << "LOCAL\n";
      break;
    default:
      assert(false);
  } 
}

uint64_t getPointerSize(const Value *V, const DataLayout &DL,
                               const TargetLibraryInfo &TLI,
                               const Function *F) {
  uint64_t Size;
  ObjectSizeOpts Opts;
  Opts.NullIsUnknownSize = NullPointerIsDefined(F);
  if (getObjectSize(V, Size, DL, &TLI, Opts))
    return Size;
  return 0;
}

/*
change this so that you get all the aloca Information 
and when you have a load inst then check for its partner
*/
static bool safeRegion( Function &F, const TargetLibraryInfo &TLI) {

  bool changed = false;

  for (auto& B : F) {
    for (auto& I : B) {

      //get instruction obj
      Instruction *inst = &I;

      //check if the variable was store 
      bool variableStored = false;

      //get operands that are part of the instruction in main
      for(auto& op : inst->operands()){
        
        //check if any global value is used as an operand of the instruction
        if(auto *globalVar = dyn_cast<GlobalVariable>(&op)){

          // errs() << "GLOBAL VARIABLE: " << *globalVar << "\n";
          VariableType type = getVariableType(inst->getType(), globalVar);
          User *tmpVal = (llvm::User*) globalVar;

          //get the number of operands
          int OpSize = tmpVal->getNumOperands();
          //size of the variable
          long size = 0;

          //in case the global variable has multiple operands
          if(OpSize){
            for(auto& tmpOp : tmpVal->operands()){
              size = size + getVariableSize(tmpOp->getType(), globalVar);
            }
          }
          else
            size = getVariableSize(inst->getType(), globalVar);

          if(size == 0 && type == VariableType::POINTER)
          {
            // if (Value *V = dyn_cast<Value>(inst)){
            const DataLayout &DL = inst->getModule()->getDataLayout();
            size = DL.getPointerSize();
          }
          Variables var;
          var.type = type;
          var.size = size;
          var.isStatic = true;
          var.memLoc = MemoryLocation::GLOBAL;

          //insert variable
          allVariables[inst].push_back(var);
          variableStored = true;
        }
      }

      //get malloc instances
      if(auto *callInst = dyn_cast<CallInst>(inst)){

        Function* fn = callInst->getCalledFunction();
        //get the function name
        StringRef functionName = fn->getName();
        if(functionName == "malloc" || functionName == "_Znam"){
          //errs() << "heap allocation found" << "\n";
          //get size of args
          int size = callInst->arg_size();
          //assert(size == 1);
          for(int i = 0; i < size; i++){
            Value* value = callInst->getArgOperand(i);
            if(auto *constantInt = dyn_cast<ConstantInt>(value)){
                Variables var;
                var.type = VariableType::INTEGER;
                var.size = constantInt->getZExtValue();
                var.isStatic = true;
                var.memLoc = MemoryLocation::HEAP;

                // allVariables[inst] = var;
                allVariables[inst].push_back(var);
                variableStored = true;
            }
            else{
              //errs() << "size could be determined" << "\n";
              //assert(false);
            }            
          }
        }
      }
      else if(auto *alloInst = dyn_cast<AllocaInst>(inst)){

        //errs() << "allocaInst : " << *alloInst << "\n";
        //errs() << "type : " << *(alloInst->getAllocatedType()) << "\n";

        //get the allocated type
        Type *AllocaType = alloInst->getAllocatedType();
        const DataLayout &DL = inst->getModule()->getDataLayout();
        uint64_t size = DL.getTypeAllocSize(AllocaType);

        //temp variable
        Variables var;
        var.type = getVariableType(AllocaType, NULL);
        var.size = size;
        var.isStatic = true;
        var.memLoc = MemoryLocation::STACK;

        allVariables[inst].push_back(var);
        variableStored = true;
      }

      /*
      Make sure all the types are covered
      find enums or list of all types of class variables
      */

    }
  }

  /*Collect all the instructions that use the variable*/
  for (auto& B : F) {
    for (auto& I : B) {

      //get instruction obj
      Instruction *inst = &I;
      
      //get all the instruciton that use this operand
      for(auto& op : inst->operands()){
        for(auto U : op->users()){
          if (auto I = dyn_cast<Instruction>(U)){
              // an instruction uses V
              // errs() << "inst uses operand: " << *I <<"\n";

              //check if this instruction is already recorded
              if(allInstructions.count(inst)){
                //check if the instruction that use the operand are not already included
                if (std::count(allInstructions[inst].begin(), allInstructions[inst].end(), I)) {
                    errs() << "Element found\n";
                    //do nothing
                }
                else {
                    errs() <<  "Element not found\n";
                    allInstructions[inst].push_back(I);
                }
              }
              //add instruction if not contained in datastructure
              else
                allInstructions[inst].push_back(I);
          }
        }
      }
    }
  }

  errs() << "number of variables: " << allVariables.size() << "\n";
  // for( auto var : allVariables){
  //   errs() << "inst: " << *(var.first) <<"\n";

  //   vector<Variables> values = var.second;
    
  //   for(auto value : values){
  //     printVariable(value);
  //     errs() << "\n";
  //   }
  // }


  
  llvm::Value *V1, *V2;
  

  for (auto& B : F) {
    for (auto& I : B) {
      if(auto *callInst = dyn_cast<CallInst>(&I)){
          IRBuilder<> builder(callInst);
          Function* new_func = Intrinsic::getDeclaration(F.getParent(), Intrinsic::riscv_ssmr);
          IntegerType* Int64Ty = Type::getInt64Ty(F.getParent()->getContext());
          V1 = llvm::ConstantInt::get(Int64Ty, 2);
          V2 = llvm::ConstantInt::get(Int64Ty, 6);
          std::vector<Value*> val;
          val.push_back(V1);
          val.push_back(V2);
          llvm::ArrayRef<Value *> args(val);
          Instruction* ssmr = CallInst::Create(new_func, {V1, V2});
          callInst->insertBefore(callInst);
      }
    }
  }

  //add instrinsic function here
  // static LLVMContext TheContext;
  // Module* mod = new Module("test", TheContext );
  // BasicBlock* block = BasicBlock::Create(getGlobalContext(), “entry”, temp);
  // IRBuilder<> builder(block);

  // std::vector<Type *> arg_type;
  // arg_type.push_back(IntegerType::get(getGlobalContext(),32));
  // arg_type.push_back(IntegerType::get(getGlobalContext(),64));
  // arg_type.push_back(IntegerType::get(getGlobalContext(),64));

  // Function *fun = Intrinsic::getDeclaration(mod, Intrinsic::int_ssmr,arg_type);

  return true;
}

PreservedAnalyses SafeRegionPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {

  //to be used in determining the size of the object pointed by pointer
  const TargetLibraryInfo &TLI = AM.getResult<TargetLibraryAnalysis>(F);

  if(!safeRegion(F, TLI))
    return PreservedAnalyses::all();
  return PreservedAnalyses::none();
}
