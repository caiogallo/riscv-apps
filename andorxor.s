.global _start

_start:
    addi x30, x0, 10    # add 10 (1010) to x30
    andi x31, x30, 1    # compare 10 (1010) and 1 (0001) and store result in x31 = 0 (000)

    addi x28, x0, 11    # add 11 (1011) to x28
    andi x29, x28, 3    # compare 11 (1011) and 3 (0011) and store result in x29 = 3 (0011)

    ori x27, x30, 5     # compare 10 (1010) or 5 (0101) and store result in x27 = 11 (1111)

    xori x26, x30, 6    # compare 10 (1010) xor 6 (0110) and store result in x26 = 12 (1100)
