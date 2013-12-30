require_relative '../tic_tac_toe.rb'

describe TicTacToe do
  let!(:game) {TicTacToe.new}

  describe "#valid_player?" do
    specify "player 'X' is valid" do
      game.valid_player?('X').should be_true
    end
    specify "player 'O' is valid" do
      game.valid_player?('O').should be_true
    end
    specify "player 'Z' is NOT valid" do
      game.valid_player?('Z').should_not be_true
    end
  end

  describe "#make_move" do
    let(:player) { game.players.first }
    specify "invalid location raises errors" do
      expect{ game.make_move(player, 'AB') }.to raise_error(InvalidMoveError)
    end
    it "fills in the square moved in" do
      expect{game.make_move(player, 'A1') }.to change{game.board['A1'] }.from(' ').to(player)
    end
  end

  describe "#score_row" do

  end

  describe "#new_game?" do
    it "is true for new games" do
      game.new_game?.should be_true
    end
    it "is false after a move is made" do
      game.make_move('X', 'A1')
      game.new_game?.should be_false
    end
  end
end
