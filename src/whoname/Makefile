PAS=fpc

all:
	@echo "Build whoname..."
	@$(PAS) main.pas

clean:
	@echo "Clean..."
	@rm main
	@rm main.o

global: all
	@mv main ../../whoname.out
