
ASSEMBLER := aarch64-linux-gnu-as
LINKER := aarch64-linux-gnu-ld
GDB := aarch64-linux-gnu-gdb
CC := aarch64-linux-gnu-gcc
QEMU := qemu-aarch64 
SOURCE_NAME ?= main
EXE_NAME ?= main



assemble: $(SOURCE_NAME).s
	$(ASSEMBLER) -o $(SOURCE_NAME).o $(SOURCE_NAME).s
link:
	$(LINKER) -o $(EXE_NAME) $(SOURCE_NAME).o
asm_build: assemble link

c_build: $(SOURCE_NAME).c
	$(CC) -static -o $(EXE_NAME) $(SOURCE_NAME)
run:
	$(QEMU) -L /usr/aarch64-linux-gnu -g 1234 ./$(EXE_NAME)
ndbg:
	$(GDB) -q --nh \
		-ex 'set architecture aarch64' \
		-ex 'file '$(EXE_NAME) \
		-ex 'target remote localhost:1234' \
		-ex 'layout split' \
		-ex 'layout regs'

dbg:
	$(GDB) -q --nh \
		-ex 'source ~/.gef-2024.01.py' \
		-ex 'set architecture aarch64' \
		-ex 'file '$(EXE_NAME) \
		-ex 'target remote localhost:1234' 
clean:
	rm -f *.o
	rm -f *.out
	rm -f $(EXE_NAME)
	


