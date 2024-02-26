.global start

_start:
    addi x30, x0, 5	      # add 5 to x30
    addi x31, x0, 1	      # add 1 to x31
    add  x29, x30, x31    # add x30 and x31 to x29 = 6
