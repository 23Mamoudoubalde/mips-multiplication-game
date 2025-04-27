.text
.globl find_product
.globl check_position_taken
.globl check_board_full
# Find a product on the board
# Input: $s2 = product to find
# Output: $v0 = position index if found, -1 if not found
find_product:
    la $t0, products
    li $t1, 0
    li $t2, 36
   
find_loop:
    beq $t1, $t2, product_not_found
   
    sll $t3, $t1, 2
    add $t4, $t0, $t3
    lw $t5, 0($t4)
   
    beq $t5, $s2, product_found
   
    addi $t1, $t1, 1
    j find_loop
   
product_found:
    move $v0, $t1
    jr $ra
   
product_not_found:
    li $v0, -1
    jr $ra

# Check if a position is already taken
# Input: $s3 = position index
# Output: $v0 = 1 if taken, 0 if available
check_position_taken:
    la $t0, board
    sll $t1, $s3, 2
    add $t0, $t0, $t1
    lw $t2, 0($t0)
   
    beq $t2, 0, position_available
   
    li $v0, 1
    jr $ra
   
position_available:
    li $v0, 0
    jr $ra

# Check if the board is full (draw)
# Output: $v0 = 1 if full, 0 if not full
check_board_full:
    la $t0, board
    li $t1, 0
    li $t2, 36
   
check_full_loop:
    beq $t1, $t2, board_is_full
   
    sll $t3, $t1, 2
    add $t4, $t0, $t3
    lw $t5, 0($t4)
   
    beq $t5, 0, board_not_full
   
    addi $t1, $t1, 1
    j check_full_loop
   
board_is_full:
    li $v0, 1
    jr $ra
   
board_not_full:
    li $v0, 0
    jr $ra
