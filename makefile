
GDB := aarch64-linux-gnu-gdb
CC := aarch64-linux-gnu-gcc
QEMU := qemu-aarch64 

build: main.c
	$(CC) -static -o main64 main.c
run:
	$(QEMU) -L /usr/aarch64-linux-gnu -g 1234 ./main64
ndbg:
	$(GDB) -q --nh \
		-ex 'set architecture aarch64' \
		-ex 'file main64' \
		-ex 'target remote localhost:1234' \
		-ex 'layout split' \
		-ex 'layout regs'

dbg:
	$(GDB) -q --nh \
		-ex 'source ~/.gef-2024.01.py' \
		-ex 'set architecture aarch64' \
		-ex 'file main64' \
		-ex 'target remote localhost:1234' \
		



