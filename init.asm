.text
.globl init_game

# Initialize the game board (set all positions to unclaimed)
init_game:
    la $t0, board        # Address of board
    li $t1, 0            # Counter
    li $t2, 36           # Board size
    li $t3, 0            # Value to store (0 = unclaimed)
   
init_loop:
    beq $t1, $t2, init_done
   
    # Calculate address for current position
    sll $t4, $t1, 2      # Multiply by 4 (word size)
    add $t5, $t0, $t4    # Add offset to base address
   
    # Store 0 (unclaimed)
    sw $t3, 0($t5)
   
    # Increment counter
    addi $t1, $t1, 1
    j init_loop
   
init_done:
    jr $ra
