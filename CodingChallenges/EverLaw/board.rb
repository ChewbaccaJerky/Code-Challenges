require_relative "piece"
require_relative "null_piece"

class Board
    attr_reader :grid

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        generateGrid(fill_board)
    end

    def [](pos)
        raise 'invalid pos' unless valid_pos?(pos)

        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, piece)
        raise 'invalid pos' unless valid_pos?(pos)

        row = pos[0]
        col = pos[1]
        @grid[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        raise 'no piece in start position' unless self[start_pos]
        raise 'Not allowed to move here. There is a piece here.' unless self[end_pos].class == NullPiece
    
        piece = self[start_pos]

        self[end_pos] = piece
        self[start_pos] = @sentinel
    end

    def valid_pos?(pos)
        pos.each do |coord|
            return false unless coord.between?(0,7)
        end
        
        true
    end

    def pieces
        @grid.flatten.reject {|piece| piece.class != NullPiece}
    end

    def dup
        new_board = Board.new(false)

        pieces.each do |piece|
            if piece.class == NullPiece
                piece.class.instance
            else
                piece.class.new(piece.color, piece.pos, new_board)
            end
        end

        new_board
    end

    private 

    def generateGrid(fill_board)
        @grid = Array.new(8){Array.new(8, @sentinel)}
        return unless fill_board

        fill_grid_with_pieces
    end

    def fill_grid_with_pieces
        @grid.each.with_index do |row, i|
            @grid.each.with_index do |piece, j|
                if (i + j) % 2 == 0
                    if i < 3
                        @grid[i][j] = Piece.new('black', [i, j], self)
                    elsif i > 4
                        @grid[i][j] = Piece.new('red', [i, j], self)
                    end
                end
            end
        end
    end
end