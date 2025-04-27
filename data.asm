.data
.globl board
.globl products
.globl welcome
.globl instructions
.globl instructions2
.globl player_turn
.globl number1_prompt
.globl number2_prompt
.globl computer_turn
.globl computer_choice
.globl product_msg
.globl already_taken
.globl not_on_board
.globl player_win
.globl computer_win
.globl draw_game
.globl play_again
.globl goodbye
.globl newline
.globl space
.globl separator
.globl empty_cell
.globl player_cell
.globl computer_cell
.globl number_line
.globl number_row

# Board and Products
board:          .word 0:36

products:       .word 1,2,3,4,5,6,7,8,9,10,12,14,15,16,18,20,21,24,25,27,28,30,32,35,36,40,42,45,48,49,54,56,63,64,72,81

# Messages
welcome:        .asciiz "\n===== Multiplication Connect Four Game =====\n\n"
instructions:   .asciiz "Get four in a row by multiplying numbers 1-9!\n"
instructions2:  .asciiz "Take turns with the computer to claim products on the board.\n\n"

player_turn:    .asciiz "\nYOUR TURN: Select two numbers (1-9) to multiply\n"
number1_prompt: .asciiz "Enter first number (1-9): "
number2_prompt: .asciiz "Enter second number (1-9): "

computer_turn:  .asciiz "\nCOMPUTER TURN...\n"
computer_choice:.asciiz "Computer chooses: "

product_msg:    .asciiz "Product is: "
already_taken:  .asciiz "That product is already taken! Try again.\n"
not_on_board:   .asciiz "That product is not on the board! Try again.\n"

player_win:     .asciiz "\nCongratulations! You win with four in a row!\n"
computer_win:   .asciiz "\nComputer wins with four in a row!\n"
draw_game:      .asciiz "\nThe game is a draw - the board is full!\n"

play_again:     .asciiz "\nPlay again? (1 for yes, 0 for no): "
goodbye:        .asciiz "\nThanks for playing! Goodbye!\n"

newline:        .asciiz "\n"
space:          .asciiz " "
separator:      .asciiz " | "

# Display symbols
empty_cell:     .asciiz "  "
player_cell:    .asciiz "P "
computer_cell:  .asciiz "C "

# Number line display (1-9)
number_line:    .asciiz "\nSelect from these numbers:\n"
number_row:     .asciiz "1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9\n"
