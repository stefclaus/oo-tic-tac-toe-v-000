class TicTacToe
 
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def board=(board)
    @board =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
 
  def board
    @board
  end

   WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # First column
    [1,4,7],  # Middle column
    [2,5,8],  # Last column
    [0,4,8],  # diagnoal one 
    [2,4,6]  # last diagnal 
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    converted_input = user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  
  def turn_count
    counter = 0
    @board.each do |turns|
      if turns == "X" || turns == "O"
        counter += 1 
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
     "X"
    else 
     "O"
    end
  end 

  def turn
    puts "Please enter 1-9:"
     user_input = gets.strip
     index = input_to_index(user_input)
     if valid_move?(index) == true
       move(index, character = current_player)
       display_board
      else turn
    end
  end
  
end 