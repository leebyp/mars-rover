require './lib/rover'

describe Rover do

  before :each do
    @rover = Rover.new(0, 0, 'N')
  end

  it 'should have starting co-ordinates and direction on instantiation' do
    expect(@rover.x).to eq(0)
    expect(@rover.y).to eq(0)
    expect(@rover.direction).to eq('N')
  end

  it 'should update direction on turning left' do
    @rover.action('L')
    expect(@rover.direction).to eq('W')

    @rover.action('L')
    expect(@rover.direction).to eq('S')

    @rover.action('L')
    expect(@rover.direction).to eq('E')
    
    @rover.action('L')
    expect(@rover.direction).to eq('N')
  end

  it 'should update direction on turning right' do
    @rover.action('R')
    expect(@rover.direction).to eq('E')

    @rover.action('R')
    expect(@rover.direction).to eq('S')

    @rover.action('R')
    expect(@rover.direction).to eq('W')
    
    @rover.action('R')
    expect(@rover.direction).to eq('N')
  end

  it 'should update position correctly on moving' do
    @rover.action('M')
    expect(@rover.x).to eq(0)
    expect(@rover.y).to eq(1)

    @rover.action('R')
    @rover.action('M')
    expect(@rover.x).to eq(1)
    expect(@rover.y).to eq(1)

    @rover.action('R')
    @rover.action('M')
    expect(@rover.x).to eq(1)
    expect(@rover.y).to eq(0)
    
    @rover.action('R')
    @rover.action('M')
    expect(@rover.x).to eq(0)
    expect(@rover.y).to eq(0)
  end

end