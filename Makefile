CPP=g++
CPPFLAGS=-o main.out

all:
    @echo "Build..."
    @$(CPP) $(CPPFLAGS) src/calc.cpp

clean:
    @echo "Clean..."
    @rm src/main.out
