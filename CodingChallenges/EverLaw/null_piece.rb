require 'singleton'
require_relative "piece"

class NullPiece < Piece
    attr_reader :symbol, :color
    include Singleton

    def initialize
        @symbol = "_"
        @color = :none
    end

    def moves
        []
    end
end