require './lib/rover'
require './lib/grid'

class Mars

  attr_accessor :max_coordinates, :grid, :rovers
  attr_accessor :rovers_data, :commands_data, :raw_data

  def initialize input_file
    def parse_data raw_data
      @max_coordinates = @raw_data[0].split(' ')
      @grid = Grid.new(Integer(@max_coordinates[0]), Integer(@max_coordinates[0]))
      @rovers_data = []
      @commands_data = []
      @rovers = []
      (1...@raw_data.length).step(2) do |i|
        @rovers_data  << @raw_data[i].split(' ')
      end
      (2...@raw_data.length).step(2) do |i|
        @commands_data  << @raw_data[i]
      end
    end

    @raw_data = []
    f = File.open(input_file)
    f.each_line do |line|
      @raw_data << line.slice(0...line.length-1)
    end
    f.close

    parse_data(@raw_data)
  end

  def deploy_rovers rovers_data
    @rovers_data.each do |rover_data|
      @rovers << Rover.new(Integer(rover_data[0]), Integer(rover_data[1]), rover_data[2])
      @grid.blocked[Integer(rover_data[0])][Integer(rover_data[1])] = 1
    end
  end

  def move_rovers rovers
    rovers.each_with_index do |rover, index|
      @commands_data[index].split('').each do |command|
        @grid.blocked[rover.x][rover.y] = 0
        old_x = rover.x
        old_y = rover.y
        old_direction = rover.direction
        rover.action(command)
        if (rover.x > @grid.max_x or rover.x < 0 or rover.y > @grid.max_y or rover.y < 0 or @grid.blocked[rover.x][rover.y] == 1)
          rover.x = old_x
          rover.y = old_y
          rover.direction = old_direction
        end
        @grid.blocked[rover.x][rover.y] = 1
      end
    end
  end

  def log rovers
    rovers.each do |rover|
      puts "\n#{rover.x} #{rover.y} #{rover.direction}\n"
    end
  end

end