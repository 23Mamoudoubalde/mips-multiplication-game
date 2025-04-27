.text
.globl computer_turn_handler
# Computer's turn
computer_turn_handler:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
    li $v0, 4
    la $a0, computer_turn
    syscall
   
    jal computer_random_move
   
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Make a random valid move for the computer
computer_random_move:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
try_random_move:
    li $v0, 42
    li $a1, 9
    syscall
    addi $a0, $a0, 1
    move $s0, $a0
   
    li $v0, 42
    li $a1, 9
    syscall
    addi $a0, $a0, 1
    move $s1, $a0
   
    mul $s2, $s0, $s1
   
    jal find_product
    beq $v0, -1, try_random_move
   
    move $s3, $v0
   
    jal check_position_taken
    beq $v0, 1, try_random_move
   
    li $v0, 4
    la $a0, computer_choice
    syscall
   
    li $v0, 1
    move $a0, $s0
    syscall
   
    li $v0, 4
    la $a0, separator
    syscall
   
    li $v0, 1
    move $a0, $s1
    syscall
   
    li $v0, 4
    la $a0, newline
    syscall
   
    li $v0, 4
    la $a0, product_msg
    syscall
   
    li $v0, 1
    move $a0, $s2
    syscall
   
    li $v0, 4
    la $a0, newline
    syscall
   
    la $t0, board
    sll $t1, $s3, 2
    add $t0, $t0, $t1
    li $t2, 2
    sw $t2, 0($t0)
   
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
