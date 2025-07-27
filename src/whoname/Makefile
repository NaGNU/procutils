N=nim

all:
	@echo "Build whoname..."
	@$(N) main.pas

clean:
	@echo "Clean..."
	@rm main
	@rm main.o

global: all
	@mv main ../../whoname.out
