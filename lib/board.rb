class Board

  attr_reader :markers
  attr_accessor :surface

  def initialize(markers, number_of_rows)
    size = number_of_rows * number_of_rows
    @surface = (1..size).map{|el| el.to_s}
    @markers = markers
  end

  def fill_spot(spot, marker)
    surface[spot.to_i] = marker
  end

  def available_spot(spot)
    !markers.include?(surface[spot.to_i])
  end
end