require_relative '../tic_tac_toe.rb'

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe "#valid_player?" do

    specify "player 'X' is valid" do
      expect(game.valid_player?('X')).to be true
    end

    specify "player 'O' is valid" do
      expect(game.valid_player?('O')).to be true
    end

    specify "player 'Z' is NOT valid" do
      expect(game.valid_player?('Z')).to_not be true
    end
  end

  describe "#make_move" do
    let(:player) { TicTacToe::PLAYERS.first }

    specify "invalid location raises errors" do
      expect{ game.make_move(player, 'AB') }.to raise_error(InvalidMoveError)
    end

    it "fills in the square moved in" do
      expect{
        game.make_move(player, 'A1')
      }.to change{game.board['A1'] }.from(' ').to(player)
    end
  end

  describe "#score_row" do

  end

  describe "#new_game?" do
    it "is true for new games" do
      expect(game.new_game?).to be true
    end

    it "is false after a move is made" do
      game.make_move('X', 'A1')
      expect(game.new_game?).to be false
    end
  end
end
