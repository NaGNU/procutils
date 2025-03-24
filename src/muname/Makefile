CPP = g++
KCFLAGS = -O3 -static
TARGET = muname.cpp
OUT = muname.out

all:
	@echo "Build muname..."
	@$(CPP) $(TARGET) $(KCFLAGS) -o $(OUT)

global:
	@echo "Build muname for global usage..."
	@$(CPP) $(TARGET) $(KCFLAGS) -o ../../muname.out

clean:
	@echo "Clean..."
	@rm $(OUT)

install: $(OUT)
	@echo "Install muname..."
	@cp $(OUT) /usr/local/bin/muname

uninstall:
	@echo "Uninstall muname..."
	@rm -f /usr/local/bin/muname

.PHONY: all clean global install uninstall

