all:
	@echo "Build all..."
	@make calc
	@make yes
	@make cat
	@make whoname

calc: 
	@$(MAKE) -C src/calc global

yes:
	@$(MAKE) -C src/yes global

cat:
	@$(MAKE) -C src/cat global

whoname:
	@$(MAKE) -C src/whoname global

clean:
	@echo "Clean..."
	@rm *.out
