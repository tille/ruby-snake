class Block
  attr_reader :x, :y

  def initialize(window, args = {})
    @block_image = Gosu::Image.new(window, "media/block_3.png", false)
    locate_at(args[:x], args[:y])
  end

  def locate_at(x, y)
    @x = x || (rand * 32).to_int * @block_image.width
    @y = y || (rand * 24).to_int * @block_image.height
  end

  def move(direction)
    case direction
      when 'up'
        @y -= 20;
      when 'down'
        @y += 20;
      when 'left'
        @x -= 20;
      when 'right'
        @x += 20;
    end

    @x %= 640
    @y %= 480
  end

  def draw
    @block_image.draw(x, y, z_pos = 1)
  end
end