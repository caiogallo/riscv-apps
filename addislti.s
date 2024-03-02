.global start

_start:    
    addi x30, x0, 10	# add 10 to x30 
    addi x31, x0, -5    # sub -5 to x31
    add  x29, x30, x31  # add x30 and x31 to x29 = 5

    slti  x28, x29, 6   # set 1 to x28
    slti  x27, x29, 4   # set 0 to x27
    slti  x26, x29, 5   # set 0 to x26
