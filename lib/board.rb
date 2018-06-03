class Board
  attr_accessor  :board_values



  def initialize
    #create empty values with easy to read keys
    @row1 = {"A1" => " ", "A2" => " ", "A3" => " "}
    @row2 = {"B1" => " ", "B2" => " ", "B3" => " "}
    @row3 = {"C1" => " ", "C2" => " ", "C3" => " "}
    @board_values = [@row1, @row2, @row3]

  end

  def user_display_board
    #user-friendly display
    puts "After selecting whether you're playing as X or O, you can choose your play position by picking one of the spots displayed below."
    puts ""
    puts " A1 | A2 | A3 "
    puts "----|----|----"
    puts " B1 | B2 | B3 "
    puts "----|----|----"
    puts " C1 | C2 | C4 "
    puts ""
  end

  def display
    #actual game board, self calling on empty strings
    puts ""
    puts "   1   2   3  "
    # puts ""

    puts "A  #{board_values[0]["A1"]} | #{board_values[0]["A2"]} | #{board_values[0]["A3"]} "
    puts "  ---|---|---"
    puts "B  #{board_values[1]["B1"]} | #{board_values[1]["B2"]} | #{board_values[1]["B3"]}"
    puts "  ---|---|---"
    puts "C  #{board_values[2]["C1"]} | #{board_values[2]["C2"]} | #{board_values[2]["C3"]} "
    puts ""

  end

  def reset_board
    @board_values = [
                      @row1 = {"A1" => " ", "A2" => " ", "A3" => " "},
                      @row2 = {"B1" => " ", "B2" => " ", "B3" => " "},
                      @row3 = {"C1" => " ", "C2" => " ", "C3" => " "},
                    ]
  end

end
