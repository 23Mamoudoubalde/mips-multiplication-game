.text
.globl check_win
# Check for a win (four in a row)
# Output: $v0 = 1 if player wins, 2 if computer wins, 0 if no win
check_win:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
    jal check_horizontal
    bne $v0, 0, check_win_return
   
    jal check_vertical
    bne $v0, 0, check_win_return
   
    jal check_diagonals
   
check_win_return:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Check for horizontal wins
check_horizontal:
    la $t0, board
    li $t1, 0
    li $t2, 6
   
horizontal_row_loop:
    beq $t1, $t2, no_horizontal_win
   
    li $t3, 0
    li $t4, 3
   
horizontal_col_loop:
    beq $t3, $t4, next_horizontal_row
   
    mul $t5, $t1, 6
    add $t5, $t5, $t3
   
    move $t6, $t5
    addi $t7, $t5, 1
    addi $t8, $t5, 2
    addi $t9, $t5, 3
   
    sll $t6, $t6, 2
    add $t6, $t0, $t6
    sll $t7, $t7, 2
    add $t7, $t0, $t7
    sll $t8, $t8, 2
    add $t8, $t0, $t8
    sll $t9, $t9, 2
    add $t9, $t0, $t9
   
    lw $s0, 0($t6)
    lw $s1, 0($t7)
    lw $s2, 0($t8)
    lw $s3, 0($t9)
   
    beq $s0, 0, next_horizontal_col
    bne $s0, $s1, next_horizontal_col
    bne $s0, $s2, next_horizontal_col
    bne $s0, $s3, next_horizontal_col
   
    move $v0, $s0
    jr $ra
   
next_horizontal_col:
    addi $t3, $t3, 1
    j horizontal_col_loop
   
next_horizontal_row:
    addi $t1, $t1, 1
    j horizontal_row_loop
   
no_horizontal_win:
    li $v0, 0
    jr $ra

# Check for vertical wins
check_vertical:
    la $t0, board
    li $t1, 0
    li $t2, 6
   
vertical_col_loop:
    beq $t1, $t2, no_vertical_win
   
    li $t3, 0
    li $t4, 3
   
vertical_row_loop:
    beq $t3, $t4, next_vertical_col
   
    mul $t5, $t3, 6
    add $t5, $t5, $t1
   
    move $t6, $t5
    addi $t7, $t5, 6
    addi $t8, $t5, 12
    addi $t9, $t5, 18
   
    sll $t6, $t6, 2
    add $t6, $t0, $t6
    sll $t7, $t7, 2
    add $t7, $t0, $t7
    sll $t8, $t8, 2
    add $t8, $t0, $t8
    sll $t9, $t9, 2
    add $t9, $t0, $t9
   
    lw $s0, 0($t6)
    lw $s1, 0($t7)
    lw $s2, 0($t8)
    lw $s3, 0($t9)
   
    beq $s0, 0, next_vertical_row
    bne $s0, $s1, next_vertical_row
    bne $s0, $s2, next_vertical_row
    bne $s0, $s3, next_vertical_row
   
    move $v0, $s0
    jr $ra
   
next_vertical_row:
    addi $t3, $t3, 1
    j vertical_row_loop
   
next_vertical_col:
    addi $t1, $t1, 1
    j vertical_col_loop
   
no_vertical_win:
    li $v0, 0
    jr $ra

# Check for diagonal wins
check_diagonals:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
    jal check_down_right
    bne $v0, 0, diagonal_win
   
    jal check_down_left
   
diagonal_win:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Check down-right diagonals
check_down_right:
    la $t0, board
    li $t1, 0
    li $t2, 3
   
dr_row_loop:
    beq $t1, $t2, no_dr_win
   
    li $t3, 0
    li $t4, 3
   
dr_col_loop:
    beq $t3, $t4, next_dr_row
   
    mul $t5, $t1, 6
    add $t5, $t5, $t3
   
    move $t6, $t5
    addi $t7, $t5, 7
    addi $t8, $t5, 14
    addi $t9, $t5, 21
   
    sll $t6, $t6, 2
    add $t6, $t0, $t6
    sll $t7, $t7, 2
    add $t7, $t0, $t7
    sll $t8, $t8, 2
    add $t8, $t0, $t8
    sll $t9, $t9, 2
    add $t9, $t0, $t9
   
    lw $s0, 0($t6)
    lw $s1, 0($t7)
    lw $s2, 0($t8)
    lw $s3, 0($t9)
   
    beq $s0, 0, next_dr_col
    bne $s0, $s1, next_dr_col
    bne $s0, $s2, next_dr_col
    bne $s0, $s3, next_dr_col
   
    move $v0, $s0
    jr $ra
   
next_dr_col:
    addi $t3, $t3, 1
    j dr_col_loop
   
next_dr_row:
    addi $t1, $t1, 1
    j dr_row_loop
   
no_dr_win:
    li $v0, 0
    jr $ra

# Check down-left diagonals
check_down_left:
    la $t0, board
    li $t1, 0
    li $t2, 3
   
dl_row_loop:
    beq $t1, $t2, no_dl_win
   
    li $t3, 3
    li $t4, 6
   
dl_col_loop:
    beq $t3, $t4, next_dl_row
   
    mul $t5, $t1, 6
    add $t5, $t5, $t3
   
    move $t6, $t5
    addi $t7, $t5, 5
    addi $t8, $t5, 10
    addi $t9, $t5, 15
   
    sll $t6, $t6, 2
    add $t6, $t0, $t6
    sll $t7, $t7, 2
    add $t7, $t0, $t7
    sll $t8, $t8, 2
    add $t8, $t0, $t8
    sll $t9, $t9, 2
    add $t9, $t0, $t9
   
    lw $s0, 0($t6)
    lw $s1, 0($t7)
    lw $s2, 0($t8)
    lw $s3, 0($t9)
   
    beq $s0, 0, next_dl_col
    bne $s0, $s1, next_dl_col
    bne $s0, $s2, next_dl_col
    bne $s0, $s3, next_dl_col
   
    move $v0, $s0
    jr $ra
   
next_dl_col:
    addi $t3, $t3, 1
    j dl_col_loop
   
next_dl_row:
    addi $t1, $t1, 1
    j dl_row_loop
   
no_dl_win:
    li $v0, 0
    jr $ra
