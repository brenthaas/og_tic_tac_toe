require_relative '../perfect_ai.rb'
require_relative '../tic_tac_toe.rb'

describe PerfectAi do
  let(:player) {'X'}
  let(:opponent) {'O'}
  let(:game) { TicTacToe.new }

  subject { PerfectAi.new(player) }

  describe "#choose_location" do
    it "starts in the center square" do
      subject.pick_move(game).should == 'B2'
    end
  end

  describe "#find_winning_row" do
    it "takes an available win" do
      game.make_move player, 'A1'
      game.make_move player, 'A2'
      subject.find_winning_row(game).should == %w(A1 A2 A3)
    end
  end

end
