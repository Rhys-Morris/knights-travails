require_relative('./Gameboard')

# Testing from random positions
new_game = Gameboard.new()
10.times do
    start = new_game.random_position
    finish = new_game.random_position
    new_game.knight_moves(start, finish)
end

# Test from same start/finish
new_game.knight_moves([0, 0], [0, 0])