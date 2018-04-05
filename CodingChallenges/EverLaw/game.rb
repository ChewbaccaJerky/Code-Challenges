require_relative "board"
require_relative "human_player"

class Game

    def initialize
        @board = Board.new
        @display = Display.print_grid(@board)
        @players = {
            black: HumanPlayer.new("black", @display),
            red: HumanPlayer.new("red", @display)
        }

        @current_player = :red
    end

    def play
        # set end game boolean later
        while true
            begin
                
                # if current user's pieces can jump
                    # until piece cannot jump anymore
                        # start_pos, end_pos = players[@current_player].make_move
                        # board.move_piece
                        # remove jumped piece
                # else
                    # get piece to move
                    # get valid moves
                    # board make move
                # end
                
            rescue Exception => e
                # print e.message
            end

            # clear terminal
            # @display.render
        end
    end

    private 

    def swap_turn!
        if @current_player == red
            @current_player = :black
        else
            @current_player = :red
        end
    end
end

if $PROGRAM_NAME == __FILE__
    Game.new.play
end