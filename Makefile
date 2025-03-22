CPP=g++
CPPFLAGS=-o main.out

all:
    @echo "Build..."
    @$(CPP) $(CPPFLAGS) main.cpp

clean:
    @echo "Clean..."
    @rm main.out
