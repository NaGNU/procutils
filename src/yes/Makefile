ZIG=zig
ZFLAGS=cc -O3  
TARGET=yes.zig

all:
	@echo "Build yes..."
	@$(ZIG) $(ZFLAGS) $(TARGET) -o main
	@rm -r zig-cache

global:
	@echo "Build yes..."
	@$(ZIG) $(ZFLAGS) $(TARGET) -o ../../yes.out
	@rm -r zig-cache

clean: 
	@echo "Clean..."
	@rm main 

