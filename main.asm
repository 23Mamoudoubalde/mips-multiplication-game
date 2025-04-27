.text
.globl main

main:
    li $v0, 4
    la $a0, welcome
    syscall

    li $v0, 4
    la $a0, instructions
    syscall

    li $v0, 4
    la $a0, instructions2
    syscall

    jal init_game

game_loop:
    jal display_board
    jal display_number_line

    jal check_board_full
    beq $v0, 1, game_draw

    jal player_turn_handler
    jal check_win
    beq $v0, 1, player_wins

    jal check_board_full
    beq $v0, 1, game_draw

    jal display_board
    jal display_number_line

    jal computer_turn_handler
    jal check_win
    beq $v0, 2, computer_wins

    j game_loop

player_wins:
    li $v0, 4
    la $a0, player_win
    syscall
    j game_end

computer_wins:
    li $v0, 4
    la $a0, computer_win
    syscall
    j game_end

game_draw:
    li $v0, 4
    la $a0, draw_game
    syscall

game_end:
    jal display_board

    li $v0, 4
    la $a0, play_again
    syscall

    li $v0, 5
    syscall
    beq $v0, 1, main

    li $v0, 4
    la $a0, goodbye
    syscall

    li $v0, 10
    syscall
