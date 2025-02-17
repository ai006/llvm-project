#ifndef LLVM_TRANSFORMS_HELLONEW_SafeRegion_H
#define LLVM_TRANSFORMS_HELLONEW_SafeRegion_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class SafeRegionPass : public PassInfoMixin<SafeRegionPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif // LLVM_TRANSFORMS_HELLONEW_SafeRegion_H