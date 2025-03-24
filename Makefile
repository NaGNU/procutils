GLB=global

all:
	@echo "Build all..."
	@make calc
	@make yes
	@make cat
	@make whoname
	@make ls
	@make touchf
	@make me
	@make sul
	@make muname
	@rmv

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

me:
	@$(MAKE) -C src/me $(GLB)

sul:
	@$(MAKE) -C src/sul $(GLB)

muname:
	@$(MAKE) -C src/muname $(GLB)

rmv:
	@$(MAKE) -C src/rmv $(GLB)

clean:
	@echo "Clean..."
	@rm *.out
