CPP=g++
CPPFLAGS=-o main.out

all:
    @echo "Build..."
    @$(CPP) $(CPPFLAGS) src/calc.cpp

install: all
    @echo "Install..."
    @sudo cp src/main.out /usr/local/bin/nasralutils

uninstall:
    @echo "Uninstall..."
    @sudo rm /usr/local/bin/nasralutils

clean:
    @echo "Clean..."
    @rm src/main.out
