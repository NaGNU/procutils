all:
	@echo "Build all..."
	@make calc
	@make yes

calc: 
	@$(MAKE) -C src/calc global

yes:
	@$(MAKE) -C src/yes global

clean:
	@echo "Clean..."
	@rm *.out
