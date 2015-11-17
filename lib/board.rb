class Board

  attr_reader :surface

  def initialize(rows)
    size = rows * rows
    @surface = (1..size).map{|el| el.to_s}
  end
end