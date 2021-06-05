class Gameboard
    attr_reader :gameboard

    def initialize
        @gameboard = []
        populate_gameboard
    end

    def populate_gameboard
        for i in 0..7
            row = []
            for j in 0..7
                row << [i, j]
            end
            @gameboard << row
        end
    end

    def random_position
        row = rand(0..7)
        cell = rand(0..7)
        gameboard[row][cell]
    end

    def legal_moves(position)
        moves = []
        row, cell = position

        moves << [row - 2, cell - 1] if row > 1 && cell > 0     # 2 up 1 left
        moves << [row - 2, cell + 1] if row > 1 && cell < 7     # 2 up 1 right
        moves << [row - 1, cell - 2] if row > 0 && cell > 1     # 2 left 1 up
        moves << [row + 1, cell - 2] if row < 7 && cell > 1     # 2 left 1 down
        moves << [row - 1, cell + 2] if row > 0 && cell < 6     # 2 right 1 up
        moves << [row + 1, cell + 2] if row < 7 && cell < 6     # 2 right 1 down
        moves << [row + 2, cell + 1] if row < 6 && cell < 7     # 2 down 1 right
        moves << [row + 2, cell - 1] if row < 6 && cell > 0     # 2 down 1 left
        moves
    end

    def knight_moves(start, finish)
        puts "Starting at: #{start}"
        puts "Looking for: #{finish}"

        ## Establish queue of gameboard nodes to check
        queue = [{position: start, moves: 0, path: []}]
        node = queue[0]

        while node[:position] != finish
            node = queue[0]

            ## Add new nodes to queue
            current_moves = node[:moves]
            possible_moves = legal_moves(node[:position])
            possible_moves.each do |move|
                queue << {
                    position: move,
                    moves: current_moves + 1,
                    # Create new path array with previous nodes visited
                    path: [node[:position]].concat(node[:path])   
                }
            end
            queue.shift
        end

        puts "Found in #{node[:moves]} moves"
        pp "Path taken #{node[:path].reverse << node[:position]}"  # Add finish position
        puts "\n"
    end 
end

# Testing from random positions

new_game = Gameboard.new()
10.times do
    start = new_game.random_position
    finish = new_game.random_position
    new_game.knight_moves(start, finish)
end
# Test from same start/finish
new_game.knight_moves([0, 0], [0, 0])