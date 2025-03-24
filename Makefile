GLB=global

all:
	@echo "Build all..."
	@make calc
	@make yes
	@make cat
	@make whoname
	@make ls
	@make touchf

calc: 
	@$(MAKE) -C src/calc $(GLB) 

yes:
	@$(MAKE) -C src/yes $(GLB) 

cat:
	@$(MAKE) -C src/cat $(GLB) 

whoname:
	@$(MAKE) -C src/whoname $(GLB) 

ls:
	@$(MAKE) -C src/ls $(GLB)

touchf:
	@$(MAKE) -C src/touchf $(GLB)

clean:
	@echo "Clean..."
	@rm *.out
