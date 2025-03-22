CPP=g++
CPPFLAGS=-o main.out

all:
    @echo "Build..."
    @$(CPP) $(CPPFLAGS) main.cpp

install: all
    @echo "Install..."
    @sudo cp main.out /usr/local/bin/nasralutils

uninstall:
    @echo "Uninstall..."
    @sudo rm /usr/local/bin/nasralutils

clean:
    @echo "Clean..."
    @rm main.out
