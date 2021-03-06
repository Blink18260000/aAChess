require "byebug"
module Orth_module

  POS = [
    [1, 1],
    [-1, 1],
    [1, 0],
    [-1, 0]
  ]

  def valid_moves_orth
    move_list = []

    POS.each do |inds|
      track_position = @position.dup
      track_position[inds[1]] += inds[0]
      while (0..7).include?(track_position[0]) && (0..7).include?(track_position[1])
        if !(@board.grid[track_position[0]][track_position[1]])
          move_list << track_position.dup
        elsif @board.grid[track_position[0]][track_position[1]].color == @color
          break
        else
          move_list << track_position.dup
          break
        end
        track_position[inds[1]] += inds[0]
      end
    end

    move_list
  end
end
