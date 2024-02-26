PWD=/home/deck/Projects/riscv-asm

clean:
	rm -rf *.o *.bin *.dump

object:
	podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-gcc -Wl,-Ttext=0x0 -nostdlib -march=rv64i -mabi=lp64 -o ${PWD}/add.o ${PWD}/add.s
	podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-gcc -Wl,-Ttext=0x0 -nostdlib -march=rv64i -mabi=lp64 -o ${PWD}/addi.o ${PWD}/addi.s

dump:
	podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-objdump -d $(PWD)/add.o > $(PWD)/add.dump
	podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-objdump -d $(PWD)/addi.o > $(PWD)/addi.dump


bin:
	podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-objcopy -O binary ${PWD}/add.o ${PWD}/add.bin
	podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-objcopy -O binary ${PWD}/addi.o ${PWD}/addi.bin

all: clean object dump bin
