require_relative "./player.rb"

class Human < Player
  def ask(question)
    print question + " "
    gets.strip
  end

  def pick_move(game)
    where = ask "Please pick a location:"
    while !game.valid_move?(where)
      ask "Location #{where} invalid, please pick another location:"
    end
    where
  end
end
