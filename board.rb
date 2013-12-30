
class Board
  SQUARES = %w(A1 A2 A3 B1 B2 B3 C1 C2 C3)

  attr_reader :wins

  def initialize(squares=nil)
    create_board
  end

  def [](index)
    @squares[index]
  end

  def []=(index, player)
    @squares[index] = player
  end

  def valid_location?(location)
    @squares.keys.include? location
  end

  def empty_locations
    @squares.select{ |loc, player| player == " "}.keys
  end

  def center_square
    'B2'
  end

  def print
    puts "  1 2 3"
    puts "A #{@squares['A1']}|#{@squares['A2']}|#{@squares['A3']}"
    puts "  -----"
    puts "B #{@squares['B1']}|#{@squares['B2']}|#{@squares['B3']}"
    puts "  -----"
    puts "C #{@squares['C1']}|#{@squares['C2']}|#{@squares['C3']}"
  end

  private
    def create_board
      @squares ||= {}
      SQUARES.each do |sq|
        @squares[sq] = " "
      end
    end
end
