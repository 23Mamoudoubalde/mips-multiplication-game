
.text
.globl display_board
.globl display_number_line

# Display the board with current game state
display_board:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
    li $v0, 4
    la $a0, newline
    syscall
   
    li $t0, 0            # Row counter
   
display_board_row:
    li $t1, 6            # Number of rows
    beq $t0, $t1, display_board_end
   
    li $t2, 0            # Column counter
   
display_board_col:
    li $t3, 6            # Number of columns
    beq $t2, $t3, display_board_end_row
   
    mul $t4, $t0, 6
    add $t4, $t4, $t2
   
    la $t5, products
    sll $t6, $t4, 2
    add $t5, $t5, $t6
    lw $t7, 0($t5)
   
    la $t5, board
    add $t5, $t5, $t6
    lw $t8, 0($t5)
   
    li $v0, 1
    move $a0, $t7
    syscall
   
    beq $t8, 0, print_empty
    beq $t8, 1, print_player
    beq $t8, 2, print_computer
   
    j display_board_col_next
   
print_empty:
    li $v0, 4
    la $a0, empty_cell
    syscall
    j display_board_col_space
   
print_player:
    li $v0, 4
    la $a0, player_cell
    syscall
    j display_board_col_space
   
print_computer:
    li $v0, 4
    la $a0, computer_cell
    syscall
   
display_board_col_space:
    li $t9, 10
    bge $t7, $t9, check_two_digits
   
    li $v0, 4
    la $a0, space
    syscall
    j display_board_col_separator
   
check_two_digits:
    li $t9, 100
    bge $t7, $t9, display_board_col_separator
   
    li $v0, 4
    la $a0, space
    syscall

display_board_col_separator:
    addi $t9, $t3, -1
    beq $t2, $t9, display_board_col_next
   
    li $v0, 4
    la $a0, separator
    syscall
   
display_board_col_next:
    addi $t2, $t2, 1
    j display_board_col
   
display_board_end_row:
    li $v0, 4
    la $a0, newline
    syscall
   
    addi $t0, $t0, 1
    j display_board_row
   
display_board_end:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Display the number line (1-9) for player selection
display_number_line:
    li $v0, 4
    la $a0, number_line
    syscall
   
    li $v0, 4
    la $a0, number_row
    syscall
   
    jr $ra
