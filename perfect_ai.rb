require_relative "./player.rb"

class PerfectAi < Player

  def initialize(player)
    determine_opponent
    super(player)
  end

  def pick_move(game)
    @game = game
    return 'B2' if @game.new_game?  #short-circuit on first move
    if winning_row = find_winning_row(@me)
      find_empty_location winning_row
    elsif blocking_row = find_winning_row(@opponent)
      find_empty_location blocking_row
    elsif center_available?
      @game.board.center_square
    else
      pick_random_empty_square
    end
  end

  def find_winning_row(player)
    @game.wins.each do |row|
      if @game.score_row(row, player) == 2
        return row
      end
    end
    nil
  end

  def find_empty_location(row)
    row.select{|loc| @game.board[loc] == " "}.first
  end

  def center_available?
    center = @game.board.center_square
    @game.board[center] == " "
  end



  def pick_random_empty_square
    @game.empty_locations.sample(1).first
  end

  # a bit sloppy, but keeps from assuming only 2 players :)
  def determine_opponent
    @opponent = TicTacToe.players.select{|p| p != @me}.first
  end
end
