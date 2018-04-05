require_relative 'display'

class HumanPlayer
    attr_reader :color, :display

    def initialize(color, display)
        @color = color
        @display = display
    end

    def make_move
        start_pos, end_pos = nil, nil

        until start_pos && end_pos
            display.render

            if start_pos
                puts "#{color}'s turn. Move from where?: row,col"
                start_pos = gets.chomp
                start_pos.split(',').map! do |coord|
                    coord.to_i
                end
            else
                puts "#{color}'s turn. Move to where?: row,col'"
                end_pos = gets.chomp
                end_pos.split(',').map! do |coord|
                    coord.to_i
                end
            end
        end
        [start_pos, end_pos]
    end
end