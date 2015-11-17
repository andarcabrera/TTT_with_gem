class Board

  attr_reader :surface, :markers

  def initialize(markers, number_of_rows)
    size = number_of_rows * number_of_rows
    @surface = (1..size).map{|el| el.to_s}
    @markers = markers
  end

  def fill_spot(spot, marker)
    surface[spot.to_i] = marker
  end
end