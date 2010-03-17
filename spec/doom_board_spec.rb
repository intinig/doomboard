require File.dirname(__FILE__) + "/../lib/doom_board"

describe DoomBoard do  
  it "should default to 10 rows" do
    board = DoomBoard.new
    board.rows.should == 10
  end

  it "should default to 16 columns" do
    board = DoomBoard.new
    board.columns.should == 16
  end

  it "should default to sender 10.7.93.1" do
    board = DoomBoard.new
    board.sender.should == "10.7.93.1"
  end

  it "should default to receiver 10.7.93.217" do
    board = DoomBoard.new
    board.receiver.should == "10.7.93.217"
  end

  it "should default to port 6454" do
    board = DoomBoard.new
    board.port.should == 6454
  end

  it "should be made of pixels" do
    board = DoomBoard.new(:rows => 1, :columns => 1)
    board.pixels.size.should == 1
    board.pixels.each do |p|
      p.should be_instance_of(Pixel)
    end
  end
  
  it "should be the correct number of pixels" do
    board = DoomBoard.new(:rows => 5, :columns => 3)
    board.pixels.size.should == 15
  end

  it "should render itself a string" do
    board = DoomBoard.new(:rows => 1, :columns => 2)
    board.to_str.should == "" << Pixel.new.to_str << Pixel.new.to_str
  end

  it "should render" do 
    pending
  end
  
  it "should be addressed by single pixels" do
    board = DoomBoard.new(:rows => 3, :columns => 5)
    board.pixel(2,3).red.should == 0
    board.pixel(2,3).green.should == 0
    board.pixel(2,3).blue.should == 0
    board.pixel(2,3).hex "#ffffff"
    board.pixel(2,3).red.should == 255
    board.pixel(2,3).green.should == 255
    board.pixel(2,3).blue.should == 255
    board.to_str.should == '' << 
      Pixel.new << Pixel.new << Pixel.new << Pixel.new << Pixel.new << 
      Pixel.new << Pixel.new << Pixel.new << Pixel.new << Pixel.new << 
      Pixel.new << Pixel.new(:hex => "#ffffff") << Pixel.new << Pixel.new << Pixel.new
  end
  
  it "should have a snake mode" do
    board = DoomBoard.new(:rows => 3, :columns => 3, :snake => true)
    board.pixel(3,3).hex "#ffffff"
    board.to_str.should == '' <<
    Pixel.new << Pixel.new << Pixel.new <<
    Pixel.new(:hex => "#ffffff") << Pixel.new << Pixel.new <<
    Pixel.new << Pixel.new << Pixel.new
  end
end