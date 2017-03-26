#include "llvm/Pass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/Instruction.h"

using namespace llvm;

namespace{
	struct LoopProps : public FunctionPass {
	 static char ID;
	 int loopID=0;
	 LoopProps() : FunctionPass(ID) {}

	 void getAnalysisUsage(AnalysisUsage &AU) const {
	 	AU.setPreservesAll();
	 	AU.addRequired<LoopInfoWrapperPass>();
		}
	 
	 // Returns a boolean value corresponding to if a loop L has subloop(s) or not.
	 bool containsSubLoops(Loop *L){
	 	if(L->getSubLoops().size()>0)
	 		return true;
	 	else
	 		return false;
	 }
	 
	 // Returns the number of top level basic blocks in a loop L.
	 int topLevelBasicBlocks(Loop *L){
	 	int totalBasicBlocks=L->getNumBlocks();
	 	int subLoopBasicBlocks=0;
	 	for(Loop *l:L->getSubLoops()){
	 		subLoopBasicBlocks+=l->getNumBlocks();
	 	}
	 	return totalBasicBlocks-subLoopBasicBlocks;
	 }

	 // Returns the number of instructions in a loop L.
	 int numInstructions(Loop *L){
	 	int instCount=0;
	 	for(BasicBlock *BB:L->getBlocks()){
	 		instCount+=BB->getInstList().size();
	 	}
	 	return instCount;
	 }

	 // Returns the number of branch instructions in a loop L.
	 int countBranchInstructions(Loop *L){
	 	int counter=0;
	 	for(BasicBlock *BB:L->getBlocks()){
	 		for(Instruction &I:*BB){
	 			if(strcmp(I.getOpcodeName(),"br")==0)
	 				counter++;
	 		}
	 	}
	 	return counter;
	 }

	 // Returns the number of top level branch instructions in a loop L.
	 int topLevelBranchInstructions(Loop *L){
	 	int totalBranchInstructions=0;
	 	int subLoopBranchInstructions=0;
	 	totalBranchInstructions=countBranchInstructions(L);
	 	for(Loop *l:L->getSubLoops()){
	 		subLoopBranchInstructions+=countBranchInstructions(l);
	 	}
	 	return totalBranchInstructions-subLoopBranchInstructions;
	 }

	 // Prints various loop properties.
		void findLoopProps(Function *F, Loop *L){
			errs() <<loopID<<": func="<< F->getName() << ", depth=" << L->getLoopDepth() << ", subloops="<< containsSubLoops(L) << ", BBs="<< topLevelBasicBlocks(L) << ", instrs="<<numInstructions(L) <<", branches="<< topLevelBranchInstructions(L) << "\n";
			loopID++;
			for(Loop *l:L->getSubLoops()){
				findLoopProps(F, l);
			}
		}
	
	 bool runOnFunction(Function &F) override {
	 	LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
	 	for(Loop *L : LI){
	 		findLoopProps(&F,L);
		}
 		return false;
 	}

 }; 
} 
char LoopProps::ID = 'a';
static RegisterPass<LoopProps> X("loop-props", "Loop Properties Pass");