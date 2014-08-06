class Rover

  attr_accessor :x, :y, :direction

  def initialize x, y, direction
    @x, @y, @direction = x, y, direction
  end

  def action movement
    case movement
    when 'L', 'R'
      turn(movement)
    when 'M'
      move
    end
  end

  def turn movement
    case movement
    when 'L'
      case @direction
      when 'N'
        @direction = 'W'
      when 'E'
        @direction = 'N'
      when 'S'
        @direction = 'E'
      when 'W'
        @direction = 'S'
      end
    when 'R'
      case @direction
      when 'N'
        @direction = 'E'
      when 'E'
        @direction = 'S'
      when 'S'
        @direction = 'W'
      when 'W'
        @direction = 'N'
      end
    end
  end

  def move
    case @direction
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'S'
      @y -= 1
    when 'W'
      @x -= 1
    end
  end
  
end