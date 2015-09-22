class Color
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def value
    [x, y]
  end

  class NoColor < Color
    def initialize
    end

    def value
      nil
    end
  end

  # Standard colors
  WHITE = Color.new(0.3227, 0.329)
  RED   = Color.new(0.6621, 0.3023)
  GREEN = Color.new(0.214, 0.709)
  BLUE  = Color.new(0.1576, 0.2368)
  NONE  = NoColor.new
end
