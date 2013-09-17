
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
    gets.chomp
    
    temp = 0
    while temp != 2 or temp != 1 do
      puts "hey"
      
    end
    
    
  end
  
  def display_board()
    
  end
  
  
  def round()
    display_board()
  end
  
  
end


nim_game = NimGame.new
nim_game.new_game()
