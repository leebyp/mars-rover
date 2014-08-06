require './lib/mars'

describe Mars do

  before :each do
    @mars = Mars.new('./spec/input/mars_test_input.txt')
  end

  it 'should take in raw data' do
    expect(@mars.raw_data[0]).to eq('5 5')
    expect(@mars.raw_data[1]).to eq('1 2 N')
    expect(@mars.raw_data[2]).to eq('LMLMLMLMM')
    expect(@mars.raw_data[3]).to eq('3 3 E')
    expect(@mars.raw_data[4]).to eq('MMRMMRMRRM')
  end

  it 'should parse raw data' do
    expect(@mars.max_coordinates).to eq(['5','5'])
    expect(@mars.rovers_data).to eq([['1','2','N'],['3','3','E']])
    expect(@mars.commands_data).to eq(['LMLMLMLMM','MMRMMRMRRM'])
  end

  it 'should create grid' do
    expect(@mars.grid.max_x).to eq(5)
    expect(@mars.grid.max_y).to eq(5)
  end

  it 'should deploy rovers' do
    @mars.deploy_rovers(@mars.rovers_data)

    expect(@mars.rovers[0].x).to eq(1)
    expect(@mars.rovers[0].y).to eq(2)
    expect(@mars.rovers[0].direction).to eq('N')

    expect(@mars.rovers[1].x).to eq(3)
    expect(@mars.rovers[1].y).to eq(3)
    expect(@mars.rovers[1].direction).to eq('E')

    expect(@mars.grid.blocked[1][2]).to eq(1)
    expect(@mars.grid.blocked[3][3]).to eq(1)
  end

  it 'should move rovers across grid correctly' do
    @mars.deploy_rovers(@mars.rovers_data)
    @mars.move_rovers(@mars.rovers)

    expect(@mars.rovers[0].x).to eq(1)
    expect(@mars.rovers[0].y).to eq(3)
    expect(@mars.rovers[0].direction).to eq('N')

    expect(@mars.rovers[1].x).to eq(5)
    expect(@mars.rovers[1].y).to eq(1)
    expect(@mars.rovers[1].direction).to eq('E')

    expect(@mars.grid.blocked[1][2]).to eq(0)
    expect(@mars.grid.blocked[3][3]).to eq(0)

    expect(@mars.grid.blocked[1][3]).to eq(1)
    expect(@mars.grid.blocked[5][1]).to eq(1)

    @mars.log(@mars.rovers)
  end

end

describe Mars do

  before :each do
    @mars = Mars.new('./spec/input/mars_test_edge_input.txt')
  end

  it 'should keep rover stationary on moving at grid edge' do
    @mars.deploy_rovers(@mars.rovers_data)
    @mars.move_rovers(@mars.rovers)

    expect(@mars.rovers[0].x).to eq(0)
    expect(@mars.rovers[0].y).to eq(0)
    expect(@mars.rovers[0].direction).to eq('S')

    @mars.log(@mars.rovers)
  end

end

describe Mars do

  before :each do
    @mars = Mars.new('./spec/input/mars_test_collision_input.txt')
  end

  it 'should keep rover remaining on moving at another rover' do
    @mars.deploy_rovers(@mars.rovers_data)
    @mars.move_rovers(@mars.rovers)

    expect(@mars.rovers[0].x).to eq(0)
    expect(@mars.rovers[0].y).to eq(0)
    expect(@mars.rovers[0].direction).to eq('S')

    @mars.log(@mars.rovers)
  end

end