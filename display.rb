require 'colorize'
require_relative "cursorable.rb"

class Display
  include Cursorable
  attr_reader :cursor_pos
  attr_accessor :valid_moves

  def initialize
    @cursor_pos = [7, 3]
    @valid_moves = []
  end

  def render_board(grid, piece_list)
    @board = grid
    current_color = :white
    system("clear")
    print " \\  a  b  c  d  e  f  g  h \n"

    grid.each_with_index do |row, ind1|
      print " #{8-ind1} "
      row.each_with_index do |tile, ind2|
        print_square(current_color, ind1, ind2, tile)
        if ind2 < 7
          current_color = current_color == :white ? :black : :white
        else
          if ind1 == 1
            print_taken_white_pieces(piece_list)
          end
          if ind1 == 3
            print_taken_black_pieces(piece_list)
          end
          print "\n"
        end
      end
    end
  end

  def print_square(current_color, ind1, ind2, tile)
        if [ind1, ind2] == @cursor_pos
          print to_square(tile, current_color).colorize(:background => :light_red)
        elsif @valid_moves.include?([ind1, ind2])
          print to_square(tile, current_color).colorize(:background => :light_green)
        else
          print to_square(tile, current_color)
        end
  end

  def to_square(piece, color)
    if piece
      return " #{piece.to_chr} ".colorize(:background => :light_magenta) if color == :white
      return " #{piece.to_chr} ".colorize(:background => :light_blue)
    else
      return "   ".colorize(:background => :light_magenta) if color == :white
      return "   ".colorize(:background => :light_blue)
    end
  end

  def print_taken_white_pieces(piece_list)
    print "   "
    lost = []
    piece_list[:white].each do |piece|
      unless piece.alive
        lost << piece
      end
    end
    lost.each do |dead_piece|
      print " #{dead_piece.to_chr} "
    end
  end

  def print_taken_black_pieces(piece_list)
    print "   "
    lost = []
    piece_list[:black].each do |piece|
      unless piece.alive
        lost << piece
      end
    end
    lost.each do |dead_piece|
      print " #{dead_piece.to_chr} ".colorize(:background => :white)
    end
  end

end
