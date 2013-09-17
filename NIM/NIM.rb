#Andrew Chumich
#Not completed
class NimGame
  def initialize()
    @board_1 = [1,3,5,7]
    @board_2 = [4,3,7]
    @game_board = []
  end
  
  
  
def dumb_computer_player 
  
  #receives a @game_board array and outputs the row and number of sticks to be removed
  
    size = 0
    while size == 0 do
    row = rand(@game_board.size) + 1
    size = @game_board[row-1]
    end
    
    
  
    num = rand(@game_board[row-1].to_i) + 1
    
    return row, num
     
  
end

#Did not have time to figure the smart player out yet. It is currently just a copy of dump_computer_player
#in order to work out the reflection functionality. Will finish later. 
def smart_computer_player
  #receives a @game_board array and outputs the row and number of sticks to be removed
    
      size = 0
      while size == 0 do
      row = rand(@game_board.size) + 1
      size = @game_board[row-1]
      end
      
      
    
      num = rand(@game_board[row-1].to_i) + 1
      
      return row, num
       
    
end

#use reflection to find methods that can take an automated turn
def choose_player
  players = []
  o = self
  #for each method, it checks if it contains 'computer_player' the keyword for an automated turn
  puts "Choose an opponent:"
  o.methods.each do |method|
    if(method.to_s.include?("computer_player"))
      players << method.to_s
    end
  end
  
  temp = 0
  while temp < players.size do
    puts "#{temp}: #{players[temp]}"
    temp += 1
  end
  
  #get users choice of opponent
  choice = -1
  while choice < 0 or choice >= players.size do
    choice = gets.chomp.to_i
  end
  
  return players[choice]
  
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
    
    
    @computer_player = choose_player
    
    
    round()
    
  end
  
  #displays board. Called each human player human_turn
  def display_board()
    row = 0
    while row < @game_board.size
      print "Row: #{row + 1} "
      @game_board[row].times do |i|
        print "*"
      end
      row += 1
      puts
    end
  end
  
  
  #Removes num sticks from row
  def remove(row, num)
    @game_board[row-1] -= num 
  end
  
  #Checks if the game is over
  def game_over()
    count = 0
    for x in @game_board
      if x == 0
        count += 1
      end
    end
    
    if count == @game_board.size
      return true
    else
      return false
    end
  end
  
  def human_turn()
    
 
    row = 0
    while row < 1 or row > @game_board.size or @game_board[row-1] < 1 do
      puts "Row (1-#{@game_board.size}): "
      row = gets.chomp.to_i
      
    end
    
    num = 0
    while num < 1 or num > @game_board[row-1] do
      puts "Number of sticks (1-#{@game_board[row-1]}): "
      num = gets.chomp.to_i
    
    end
    
    remove(row, num)
    
  end
  
  
  def computer_turn()
    row, num = 0, 0
    #determines which method to execute depending on the choice of opponent
   self.methods.each do |method|
     if(method.to_s.include?(@computer_player.to_s))
       row, num = self.send method
     end
   end
    
    remove(row, num)  
      
    puts "Computer player took #{num} sticks from row #{row}"
    if game_over()
        puts "BOO"
        abort("Computer won")
    end
    
  end
  
  def round()
    
    computer_turn()
    display_board()
    human_turn()
    if game_over()
          puts "HOORAY"
          abort("You won!")
        else
          round()
        end
    end
  
  
end


nim_game = NimGame.new
nim_game.new_game()
