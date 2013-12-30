require_relative './tic_tac_toe.rb'
require_relative './perfect_ai.rb'
require_relative './human.rb'

def get_response(statement)
  print statement + " "
  gets.strip
end

def computer_playing?
  confirm = get_response "Do you want to play against the computer?"
  !!(confirm =~ /^y/i)
end

def choose_computer_player(players)
  get_response "What player shoud the computer play as? (#{players.join(',')})"
end

def print_big_line
  puts '-'*80
end

def play_game
  game = TicTacToe.new
  pick_players(TicTacToe.players)
  while !game.winner do
    whos_playing = next_player
    puts "Player #{whos_playing} is up"
    game.board.print
    location = @players[whos_playing].pick_move(game)
    puts "Player #{whos_playing} moves to #{location}"
    game.make_move(whos_playing, location)
  end
  print_big_line
  game.board.print
  puts "Player #{game.winner} Wins!!!!"
end

def next_player
  @play_count ||= 0
  player = TicTacToe.players[(@play_count % 2)]
  @play_count+=1
  player
end

def pick_players(player_names)
  @players = {}
  player_names.each do |name|
    if (get_response "Should the computer play as #{name}?") =~ /^y/i
      puts "Player #{name} is playing with 'Perfect AI'... look out!"
      @players[name] = PerfectAi.new(name)
    else
      puts "Player #{name} is human"
      @players[name] = Human.new(name)
    end
  end
end

puts "Welcome to Tic-Tac-Toe!"
play_game
