require File.dirname(__FILE__) + "/../lib/pixel"

describe Pixel do
  it "should be black by default" do
    p = Pixel.new
    p.to_str.should eql('' << 0 << 0 << 0)
  end
  
  it "should be able to init it to an rgb value" do
    p = Pixel.new(:rgb  => [127, 127, 127])
    p.to_str.should eql('' << 127 << 127 << 127)
  end

  it "should be able to init it to an hex value" do
    p = Pixel.new(:hex  => "#ffffff")
    p.to_str.should eql('' << 255 << 255 << 255)
  end
  
  it "should be able to be set in a certain color via hex" do
    p = Pixel.new
    p.hex "#ffffff"
    p.red.should == 255
    p.green.should == 255
    p.blue.should == 255
  end

  it "should be able to be set in a certain color via rgb" do
    p = Pixel.new
    p.rgb(255,255,255)
    p.red.should == 255
    p.green.should == 255
    p.blue.should == 255
  end
end