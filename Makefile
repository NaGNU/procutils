all:
	@echo "Build all..."
	@make calc
	@make yes
	@make cat

calc: 
	@$(MAKE) -C src/calc global

yes:
	@$(MAKE) -C src/yes global

cat:
	@$(MAKE) -C src/cat global

clean:
	@echo "Clean..."
	@rm *.out
