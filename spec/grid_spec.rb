require './lib/grid'

describe Grid do

  before :each do
    @grid = Grid.new(1, 2)
  end

  it 'should have max_x and max_y values' do
    expect(@grid.max_x).to eq(1)
    expect(@grid.max_y).to eq(2)
  end

  it 'should create unblocked grid on instantiation' do
    expect(@grid.blocked[0][0]).to eq(0)
    expect(@grid.blocked[0][1]).to eq(0)
    expect(@grid.blocked[0][2]).to eq(0)
    expect(@grid.blocked[1][0]).to eq(0)
    expect(@grid.blocked[1][1]).to eq(0)
    expect(@grid.blocked[1][2]).to eq(0)
  end

end