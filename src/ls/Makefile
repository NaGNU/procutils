GHC=ghc
TARGET=ls.hs
HSFLAGS=-O3

all:
	@echo "Build ls..."
	@$(GHC) $(TARGET) $(HSFLAGS) -o ls

clean:
	@echo "Clean..."
	@rm ls ls.hi ls.o

global: all
	@mv ls ../../ls.out
