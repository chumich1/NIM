require "Player"
class Dumb_computer_player < Player
  
  #receives a board array and outputs the row and number of sticks to be removed
  def turn(board)
    size = 0
    while size == 0 do
    row = rand(board.size) + 1
    size = board[row-1]
    end
    
    
  
    num = rand(board[row-1].to_i) + 1
    
    return row, num
     
  end
end
