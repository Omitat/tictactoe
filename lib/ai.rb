require_relative "board.rb"


class Computer
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def computer_move(board)
    #
    no_fill = []
    board.board_values.each do |rows|
      rows.each do |key, value|
        if value == " "
         no_fill << {key => value}
         break
        end
      end

    end
    position = no_fill.sample.keys.first
    #pull random board position

    board.board_values.each do |value|
      if value.key?(position)
        #checking keys against position
        value[position] = self.token
        break
      end
    end
    board.display
  end

end
