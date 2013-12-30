require_relative './board.rb'
require 'yaml'

class InvalidMoveError < Exception
end

class TicTacToe
  PLAYERS = %w(X O)

  attr_reader :board
  attr_reader :wins
  attr_reader :winner

  def initialize(board=nil)
    @new_game = true
    @wins = load_wins
    @board = board || Board.new
  end

  def make_move(player, location)
    raise InvalidMoveError, "Invalid player #{player}" unless valid_player?(player)
    raise InvalidMoveError, "Invalid Move #{location}" unless valid_move?(location)
    raise InvalidMoveError, "The game has already been won." if @winner

    @new_game = false
    @board[location] = player
    @winner = find_winner
  end

  def find_winner
    @wins.each do |row|
      PLAYERS.each do |player|
        if score_row(row, player) == 3
          return player
        end
      end
    end
    nil
  end

  def score_row(row, player)
    score = 0
    row.each do |cell|
      if @board[cell] == player
        score += 1
      elsif (@board[cell] != ' ')
        return 0    # Cells with opponents render the row useless
      end
    end
    score
  end

  def self.players
    PLAYERS
  end

  def new_game?
    @new_game
  end

  def valid_player?(player)
    PLAYERS.include?(player)
  end

  def valid_move?(location)
    @board.valid_location?(location) && (@board[location] == ' ')
  end

  def load_wins
    win_file = 'wins.yml'
    YAML::load_file(File.join(__dir__, win_file)) if File.exists?(win_file)
  end
end
