PAS=fpc

all:
	@echo "Build..."
	@$(PAS) main.pas

clean:
	@echo "Clean..."
	@rm main
	@rm main.o

global: all
	@mv main ../../touchf.out
