class Board

  attr_reader :markers
  attr_accessor :surface

  def initialize(markers, number_of_rows)
    size = number_of_rows * number_of_rows
    @surface = (0..size-1).map{|el| el.to_s}
    @markers = markers
  end

  def available_spot(spot)
    !markers.include?(surface[spot.to_i])
  end

  def fill_spot(spot, marker)
    if available_spot(spot.to_i)
      surface[spot.to_i] = marker
    end
  end

  def solved_board?
    row_solved? || column_solved? || diagonals_solved?
  end

  def tied_board?
   surface.find { |spot| !markers.include?(spot)} == nil && !solved_board?
  end

  private

  def row_solved?
    partioned_board.find {|row| row.uniq.length == 1}
  end

  def column_solved?
    partioned_board.transpose.find {|row| row.uniq.length == 1}
  end

  def diagonals_solved?
    diagonals = [left_diagonal, right_diagonal]
    diagonals.find {|row| row.uniq.length == 1}
  end

  def left_diagonal
    diagonal = []
    partioned_board.select.with_index {|row, index| diagonal << row[index]}
    diagonal
  end

  def right_diagonal
    diagonal = []
    partioned_board.select.with_index {|row, index| diagonal << row[(index-(row.length - 1)).abs]}
    diagonal
  end

  def partioned_board
    splitter = Math.sqrt(surface.length).to_i
    surface.each_slice(3).to_a
  end

end