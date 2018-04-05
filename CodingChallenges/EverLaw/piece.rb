require_relative 'null_piece'

class Piece
    attr_reader :symbol, :pos, :board

    def initialize(color, pos, board)
        @color = color
        @symbol = set_symbol(color)
        @pos = pos
        @board = board
    end

    def set_symbol(color)
        symbol = '_'
        if color == 'black'
            symbol = 'B'
        elsif color == 'red'
            symbol = 'R'
        end
        symbol
    end

    def valid_moves(board)
        result = []
        pos_moves = self.moves
        pos_move = self.get_jump_moves(board) unless self.get_jump_moves(board).empty?
        test_board = board.dup

        pos_moves.each do |move|
            begin
                test_board.move_piece(@pos, move)
            rescue Exception => e
                print e.message
            else
                result << move
            end
        end

        result
    end
    
    def moves
        result = []
        row = pos[0]
        col = pos[1]
        if @color == 'black'
            result += [[row + 1,col - 1], [row + 1,col + 1]]
        elsif @color == 'red'
            result += [[row - 1,col - 1], [row - 1,col + 1]]
        end

        result
    end

    def get_jump_moves(board)  
        pos_moves = moves
        result = []
        pos_moves.each.with_index do |move, i|
            row = move[0]
            col = move[1]

            if board[row][col].class == Piece
                
                if @color == 'black'
                    # left
                    new_pos = [row + 1, col - 1]
                    result << new_pos if board.valid_pos?(new_pos) && board[new_pos[0]][new_pos[1]].class == NullPiece
                    #right
                    new_pos = [row + 1, col - 1]
                    result << new_pos if board.valid_pos?(new_pos) && board[new_pos[0]][new_pos[1]].class == NullPiece
                # red piece
                else
                    # left
                    new_pos = [row - 1, col - 1]
                    result << new_pos if board.valid_pos?(new_pos) && board[new_pos[0]][new_pos[1]].class == NullPiece
                    #right
                    new_pos = [row - 1, col + 1]
                    result << new_pos if board.valid_pos?(new_pos) && board[new_pos[0]][new_pos[1]].class == NullPiece
                end
            end
        end

        result
    end

    def jump?(board)
        get_jump_moves(board).empty? ? false : true
    end
end