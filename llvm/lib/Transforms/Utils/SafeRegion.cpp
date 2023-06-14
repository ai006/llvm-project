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

#include <map>

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
map<llvm::Instruction*, Variables> allVariables;

/*
function to use to get the type of variable
in the form of a string
*/
VariableType getVariableType(Type* var, Instruction* tmpInstruction){

    //get the type
    if(var->isIntegerTy()){
      //get the type of integer
      IntegerType* integer = (llvm::IntegerType*) var;
      if(integer->getBitWidth() == 8)
        return VariableType::CHAR;
      else if(integer->getBitWidth() == 64)
        return VariableType::LONG;
      else{
        //should get this to work tell if string etc...
        if(auto *data = dyn_cast<Constant>(tmpInstruction)){
          errs() << "found string"<<*data << "\n";
        }
        else{
          errs() << "unknown "<<*integer <<"\n";
        }
      }
      return VariableType::INTEGER;
    }
    else if(var->isFloatTy())
      return VariableType::FLOAT;
    else if(var->isDoubleTy())
      return VariableType::DOUBLE;
    
    return VariableType::UNKNOWN;
}

long getVariableSize(Type* var){
    //get the type
    if(var->isIntegerTy()){
      //get the type of integer
      IntegerType* integer = (llvm::IntegerType*) var;
      if(integer->getBitWidth() == 8)
        return 1;
      else if(integer->getBitWidth() == 64)
        return 8;
      else if(integer->getBitWidth() == 32)
        return 4;
      else 
        return 0;
    }
    else if(var->isFloatTy())
      return var->getScalarSizeInBits()/8;
    else if(var->isDoubleTy())
      return var->getScalarSizeInBits()/8;
    
    return 0;
}

// void addVariable(MemoryLocation memLoc){}

/*
change this so that you get all the aloca Information 
and when you have a load inst then check for its partner
*/
static bool safeRegion(Function &F) {

  bool changed = false;
  for (auto& B : F) {
    for (auto& I : B) {

      //get instruction obj
      Instruction *inst = &I;

      //get operands that part of the instruction in main
      for(auto& op : inst->operands()){
        
        //check if any global value is used as an operand of the instruction
        if(auto *globalInst = dyn_cast<GlobalVariable>(&op)){
          VariableType type = getVariableType(inst->getType(), inst);
          long size = getVariableSize(inst->getType());
          Variables var;
          var.type = type;
          var.size = size;
          var.isStatic = true;
          var.memLoc = MemoryLocation::GLOBAL;

          allVariables[inst] = var;
        }
      }
      //get malloc instances
      if(auto *callInst = dyn_cast<CallInst>(inst)){

        Function* fn = callInst->getCalledFunction();
        //get the function name
        StringRef functionName = fn->getName();
        if(functionName == "malloc" || functionName == "_Znam"){
          errs() << "heap allocation found" << "\n";
          //get size of args
          int size = callInst->arg_size();
          assert(size == 1);
          for(int i = 0; i < size; i++){
            Value* value = callInst->getArgOperand(i);
            if(auto *constantInt = dyn_cast<ConstantInt>(value)){
                Variables var;
                var.type = VariableType::INTEGER;
                var.size = constantInt->getZExtValue();
                var.isStatic = true;
                var.memLoc = MemoryLocation::HEAP;

                allVariables[inst] = var;
            }
            else{
              errs() << "size could be determined" << "\n";
            }            
          }

        }
      }

      /*
      Make sure all the types are covered
      find enums or list of all types of class variables
      */

    }
  }
  return changed;
}

PreservedAnalyses SafeRegionPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  if(!safeRegion(F))
    return PreservedAnalyses::all();
  return PreservedAnalyses::none();
}
