require_relative "lib/board.rb"
require_relative "lib/ai.rb"

require_relative "lib/player.rb"

def state
  @board = Board.new
  @win = false
  @turn = 1
  @values = @board.board_values
  @two_player = false
  @computer = false
  @draw = false
end

class Game



  def initialize
    state
    puts ""
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "Would you like to play against the computer? (y/n)"
    response = gets.chomp
    until response == "n" || response == "y"
      puts "Please respond 'y' or 'n' to playing against the computer"
      response = gets.chomp
    end
    if response == "y"
      puts "You've decided to player against the computer!"
      puts "What will your token be, X or O?"
      token_player1 = gets.chomp.upcase
      while token_player1 != "X" && token_player1 != "O"
        #validate user response
        puts "Please enter 'X' or 'O'."
        token_player1 = gets.chomp.upcase
      end
      @player1 = Player.new(token_player1)

      #determine player 2 without imput
      if token_player1 === "X"
        token_computer = "O"
      elsif token_player1 === "O"
        token_computer = "X"
      end
      @player2 = Computer.new(token_computer)
      @computer = true
      @board.user_display_board
      play
    elsif response == "n"
      @two_player = true
      two_player

    end
  end

  def two_player
    @two_player = true

    puts "What is player1's token, X or O?"
    token_player1 = gets.chomp.upcase
    while token_player1 != "X" && token_player1 != "O"
      #validate user response
      puts "Please enter 'X' or 'O'."
      token_player1 = gets.chomp.upcase
    end
    @player1 = Player.new(token_player1)
    #determine player 2 without imput
    if token_player1 === "X"
      token_player2 = "O"
    elsif token_player1 === "O"
      token_player2 = "X"
    end
    @player2 = Player.new(token_player2)
    puts "These are your move choices!"
    @board.user_display_board
    play
  end


  def play
    while !win || !draw
      #when win or draw true game ends
      puts "This is the turn #{@turn} "
      if @turn.odd?
        #switch players
        puts "Where do you want to move, Player1?"
        p1_move = gets.chomp.upcase
        player_move(p1_move, @player1.token)
      elsif  @two_player && @turn.even?
        puts "Where do you want to move, Player2?"
        p2_move = gets.chomp.upcase
        player_move(p2_move, @player2.token)
      elsif @computer && @turn.even?
        @player2.computer_move(@board)
        @turn += 1
      end

    end
  end

  def player_move(move, token)
    @values.each do |rows|
      #break into array
      rows.each do |key, value|
        #break into hash
        if key == move && value == " "
          rows[key] = token
          @turn += 1
        end
      end
    end
    @board.display
    play
  end


  def win
    row1 = @values[0]
    row2 = @values[1]
    row3 = @values[2]

    win_combo = [
      [row1["A1"],row1["A2"],row1["A3"]],
      [row2["B1"],row2["B2"],row2["B3"]],
      [row3["C1"],row3["C2"],row3["C3"]],
      [row1["A1"],row2["B1"],row3["C1"]],
      [row1["A2"],row2["B2"],row3["C2"]],
      [row1["A3"],row2["B2"],row3["C3"]],
      [row1["A1"],row2["B2"],row3["C3"]],
      [row1["A3"],row2["B2"],row3["C1"]]
    ]

    win_combo.each do |row|
      str = row.join
      if str == "XXX"
        puts "X wins!"
        @win = true
      elsif str == "OOO"
        puts "O wins"
        @win = true
      end
    end

    while @win
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      if answer == "y"
        @board.reset_board
        initialize
      elsif answer == "n"
        puts "adios"
        exit
      end
    end
  end


  def draw
    if @win == false && @turn == 9
      #   @draw = true
      # end
      # while @draw
      puts "It's a draw! Game over! Want to play again? (y/n)"
      answer = gets.chomp.downcase

      if answer == "y"
        @board.reset_board
        initialize
      elsif answer == "n"
        puts "Bye"
        exit
      end
    end
  end

end


game = Game.new
puts game
