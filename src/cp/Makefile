all:
	@echo "Build cp..."
	@ghc cp.hs -O3 -o main

global: all
	@mv main ../../cp.out
	@rm *.hi *.o 

clean:
	@echo "Clean..."
	@rm *.hi *.o main
