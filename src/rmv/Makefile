# Makefile for NaGNU/rmv

RUSTC=rustc

RFLAGS=-O --target=x86_64-unknown-linux-gnu

SRC=rmv.rs

TARGET=rm


all:
	@echo "Build rm..."
	@$(RUSTC) $(SRC) $(RFLAGS) -o $(TARGET)

global:
	@echo "Build rm (global)..."
	@$(RUSTC) $(SRC) $(RFLAGS) -o ../../$(TARGET)

clean:
	@echo "Clean..."
	@rm -f $(TARGET)

run:
	@echo "Running rm..."
	@./$(TARGET)

.PHONY: all global clean run

