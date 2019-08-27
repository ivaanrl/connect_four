class Board
  attr_accessor :grid
  attr_reader :blank
  def initialize
    @blank = "\u2610"
    @grid = Array.new(6) { Array.new(7, @blank.force_encoding('utf-8')) }
  end

  def display_board
    puts @grid.reverse.map{ |row| row.map { |value| ' ' + value.to_s + ''}.join }
    puts "\n"
  end
end

