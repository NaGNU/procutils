all:
	@echo "Build all..."
	@make calc
	@make yes

calc: 
	@$(MAKE) -C src/calc

yes:
	@$(MAKE) -C src/yes

clean:
	@echo "Clean..."
	@rm *.out
