
class NimGame
  def initialize()
    @board_1 = [1,3,5,7]
    @board_2 = [4,3,7]
    @game_board = []
  end
  
  #Starts a new game
  def new_game()
    puts "NEW GAME!"
    puts "1: #{@board_1}"
    puts "2: #{@board_2}"
   
    #Have player choose board
    temp = 0
    while temp != 2 and temp != 1 do
      puts "Choose a board"
      temp = gets.chomp.to_i
      
    end
    
    if temp == 1
      @game_board = @board_1
    else
      @game_board = @board_2
    end
    
    round()
    
  end
  
  def display_board()
    @game_board.each do |x|
      print "Row: #{@game_board.index(x) + 1} "
      x.times do |i|
        print "*"
      end
      puts
    end
  end
  
  def turn()
    
 
    row = 0
    while row < 1 or row > @game_board.size do
      puts "Row (1-#{@game_board.size}): "
      row = gets.chomp.to_i
      
    end
    
    num = 0
    while num < 1 or num > @game_board[row-1] do
      puts "Number of sticks (1-#{@game_board[row-1]}): "
      num = gets.chomp.to_i
      
    end
  end
  
  def round()
    display_board()
    turn()
  end
  
  
end


nim_game = NimGame.new
nim_game.new_game()
