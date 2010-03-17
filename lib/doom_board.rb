require File.dirname(__FILE__) + "/rartnet"
require File.dirname(__FILE__) + "/pixel"

class DoomBoard
  attr_reader :pixels, :rows, :columns, :sender, :receiver, :port
  
  def initialize(options = {})
    @rows = options.delete(:rows) || 10
    @columns = options.delete(:columns) || 16
    @sender = options.delete(:sender) || "10.7.93.1"
    @receiver = options.delete(:receiver) || "10.7.93.217"
    @port = options.delete(:port) || 6454
    
    @artnet = RArtNet.new(@sender, @receiver, @port)
    
    @pixels = Array.new(@rows * @columns) {Pixel.new}
  end
  
  def to_str
    @pixels.map do |p|
      p.to_str
    end.join("")
  end
  
  def render
    while true do
      sleep 0.2
      @artnet.artdmx(self.to_str) 
    end
  end
  
  def pixel(x, y)
    pixels[self.columns * (y - 1) + x - 1] 
  end
end
