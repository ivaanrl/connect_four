require_relative 'board'
require_relative 'player'

class Game
  
  def initialize
    @board = Board.new
    @player1 = Player.new("\u2612")
    @player2 = Player.new("\u2688")
    welcome_message
    @game_over = false
    @turn = @player1.piece
    while !@game_over
      play
      if check_win 
        @game_over = true
      else
        @turn == @player1.piece ? @turn = @player2.piece : @turn = @player1.piece
      end
    end
  end

  def play
    puts "this is the board right now: "
    puts 
    @board.display_board
    puts "Where do you want to place your piece?"
    puts "Choose row: "
    row = gets.chomp.to_i
    puts "Choose column: "
    column = gets.chomp.to_i
    if check_position(row,column)
      place_piece(row,column)
    end
  end

  def check_position(row,column)
    if !row.between?(0,5) || !column.between?(0,6)
      puts "That wasn't a valid position. Please choose again."
      play
      return
    elsif @board.grid[row][column] != "\u2610"
      puts "That position was already taken, please choose again."
      play
      return
    else
      return true
    end
  end

  def place_piece(row,column)
    @board.grid[row][column] = @turn
  end

  def check_win
    if check_row || check_column
      @board.display_board
      return true
    end
  end

  def check_row
    col = [0,1,2,3]
    row = [0,1,2,3,4]
    col.each do |column|
      row.each do |row|
        if @board.grid[row][column] == @board.grid[row][column + 1] && 
        @board.grid[row][column + 1] == @board.grid[row][column + 2] &&
        @board.grid[row][column+2] == @board.grid[row][column + 3] 
        puts "ww"
            if @board.grid[row][column] == @player1.piece
              puts "CONGRATULATIONS!!!!"
              puts "#{@player1.piece} has won!"
              return true
            elsif @board.grid[row][column] == @player2.piece
              puts "CONGRATULATIONS!!!!"
              puts "#{@player2.piece} has won!"
            else
              return false
            end
        end
      end
    end
  end

  def check_column
    col = [0,1,2,3,4,5]
    row = [0,1,2]
    row.each do |row|
      col.each do |column|
        if @board.grid[row][column] == @board.grid[row + 1][column] && 
          @board.grid[row + 1][column] == @board.grid[row + 2][column] &&
          @board.grid[row + 2][column] == @board.grid[row + 3][column]
          puts "ww"
          if @board.grid[row][column] == @player1.piece
            puts "CONGRATULATIONS!!!!"
            puts "#{@player1.piece} has won!"
            return true
          elsif @board.grid[row][column] == @player2.piece
            puts "CONGRATULATIONS!!!!"
            puts "#{@player2.piece} has won!"
          else
            return false
          end
        end
      end
    end
  end
  def welcome_message
    puts "This is Connect four!. Whomever gets 4"
    puts "pieces in a row first, wins the game."
    puts
    puts "Player 1 is: #{@player1.piece}"
    puts "Player 2 is: #{@player2.piece}"
    puts
    puts "Player 1 goes first. Have fun!"
    puts
    puts
  end
end
game = Game.new