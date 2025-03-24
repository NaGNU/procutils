all: 
	@echo "Build pwd..."
	@ghc pwd.hs -O3 -o main

global: all
	@cp main ../../pwd.out
	@make clean

clean:
	@echo "Clean..."
	@rm *.hi *.o main
