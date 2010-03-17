class Pixel
  attr_reader :red, :green, :blue
  
  def initialize(options = {})
    rgb = options.delete(:rgb)
    hex = options.delete(:hex)
    
    if rgb
      @red, @green, @blue = rgb
    elsif hex    
      @red = hex[1, 2].to_i(16)
      @green = hex[3, 2].to_i(16)
      @blue = hex[5, 2].to_i(16)
    else
      @red, @green, @blue = [0,0,0]
    end
  end
  
  def hex(hex)
    @red = hex[1, 2].to_i(16)
    @green = hex[3, 2].to_i(16)
    @blue = hex[5, 2].to_i(16)
  end
  
  def rgb(r, g, b)
    @red = r
    @green = g
    @blue = b
  end
  
  def to_str
    '' << self.red.to_i << self.green.to_i << self.blue.to_i
  end
end