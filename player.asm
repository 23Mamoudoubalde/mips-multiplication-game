
.text
.globl player_turn_handler
# Player's turn
player_turn_handler:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
    li $v0, 4
    la $a0, player_turn
    syscall
   
player_input:
    li $v0, 4
    la $a0, number1_prompt
    syscall
   
    li $v0, 5
    syscall
    move $s0, $v0
   
    li $t0, 1
    li $t1, 9
    blt $s0, $t0, invalid_input
    bgt $s0, $t1, invalid_input
   
    li $v0, 4
    la $a0, number2_prompt
    syscall
   
    li $v0, 5
    syscall
    move $s1, $v0
   
    blt $s1, $t0, invalid_input
    bgt $s1, $t1, invalid_input
   
    mul $s2, $s0, $s1
   
    li $v0, 4
    la $a0, product_msg
    syscall
   
    li $v0, 1
    move $a0, $s2
    syscall
   
    li $v0, 4
    la $a0, newline
    syscall
   
    jal find_product
   
    beq $v0, -1, product_not_on_board
   
    move $s3, $v0
   
    jal check_position_taken
    beq $v0, 1, position_already_taken
   
    la $t0, board
    sll $t1, $s3, 2
    add $t0, $t0, $t1
    li $t2, 1
    sw $t2, 0($t0)
   
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
   
invalid_input:
    li $v0, 4
    la $a0, not_on_board
    syscall
    j player_input
   
product_not_on_board:
    li $v0, 4
    la $a0, not_on_board
    syscall
    j player_input
   
position_already_taken:
    li $v0, 4
    la $a0, already_taken
    syscall
    j player_input
