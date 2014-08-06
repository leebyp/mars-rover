class Grid

  attr_reader :max_x, :max_y
  attr_accessor :blocked

  def initialize x, y
    @max_x, @max_y = x, y
    @blocked = Array.new(@max_x + 1) { Array.new(@max_y + 1, 0) }
  end
  
end