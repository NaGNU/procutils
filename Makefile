GLB=global

all:
	@echo "Build all..."
	@make calc
	@make yes
	@make cat
	@make wc
	@make cp
	@make whoname
	@make ls
	@make touchf
	@make me
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

muname:
	@$(MAKE) -C src/muname $(GLB)

rmv:
	@$(MAKE) -C src/rmv $(GLB)

wc:
	@$(MAKE) -C src/wc $(GLB)
cp:
	@$(MAKE) -C src/cp $(GLB)

clean:
	@echo "Clean..."
	@rm *.out
