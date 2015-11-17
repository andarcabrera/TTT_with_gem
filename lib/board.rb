class Board

  attr_reader :surface

  def initialize(number_of_rows)
    size = number_of_rows * number_of_rows
    @surface = (1..size).map{|el| el.to_s}
  end

  def fill_spot(spot, marker)
    surface[spot.to_i] = marker
  end
end