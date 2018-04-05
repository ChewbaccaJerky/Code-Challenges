require 'colorize'


class Display
    attr_board :board
    def initialize(board)
        @board = board
    end

    def render
        @board = @board.grid
        
        @board.each.with_index do |row, i|
            print i.to_s + ' '
            @board.each.with_index do |piece, j|
                if (i + j) % 2 == 1
                    print "[X]"
                else
                    print '[' + @board[i][j].symbol + ']'
                end
            end
            puts 
        end

        puts '   0  1  2  3  4  5  6  7'
    end
end