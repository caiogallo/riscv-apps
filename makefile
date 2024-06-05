PWD=/home/deck/Projects/riscv-asm

clean:
	@rm -rf *.o *.bin *.dump


GCC=podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-gcc
GCC_ARGS=-Wl,-Ttext=0x0 -nostdlib -march=rv64i -mabi=lp64 -o
DUMP=podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-objdump 
DUMP_ARGS=-M no-aliases -d
OBJ=podman run -it -u $(id -u):$(id -g) --userns=keep-id --rm -v /home/deck:/home/deck risc-cmp riscv64-unknown-elf-objcopy
OBJ_ARGS=-O binary

object:
	@$(GCC) $(GCC_ARGS) ${PWD}/add.o ${PWD}/add.s
	@$(GCC) $(GCC_ARGS) ${PWD}/addi.o ${PWD}/addi.s
	@$(GCC) $(GCC_ARGS) ${PWD}/addislti.o ${PWD}/addislti.s
	@$(GCC) $(GCC_ARGS) ${PWD}/andorxor.o ${PWD}/andorxor.s

dump:
	@$(DUMP) $(DUMP_ARGS) $(PWD)/add.o > $(PWD)/add.dump
	@$(DUMP) $(DUMP_ARGS) $(PWD)/addi.o > $(PWD)/addi.dump
	@$(DUMP) $(DUMP_ARGS) $(PWD)/addislti.o > $(PWD)/addislti.dump
	@$(DUMP) $(DUMP_ARGS) $(PWD)/andorxor.o > $(PWD)/andorxor.dump

bin:
	@$(OBJ) $(OBJ_ARGS) ${PWD}/add.o ${PWD}/add.bin
	@$(OBJ) $(OBJ_ARGS) ${PWD}/addi.o ${PWD}/addi.bin
	@$(OBJ) $(OBJ_ARGS) ${PWD}/addislti.o ${PWD}/addislti.bin
	@$(OBJ) $(OBJ_ARGS) ${PWD}/andorxor.o ${PWD}/andorxor.bin


all: clean object dump bin
