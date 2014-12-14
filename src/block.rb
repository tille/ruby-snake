class Block
  attr_reader :x, :y

  def initialize(window, x, y)
    @block_image = Gosu::Image.new(window, "media/block_5.png", false)
    locate_at(x, y)
  end

  def locate_at(x, y)
   @x = x || rand * 640
   @y = y || rand * 480
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
    @block_image.draw(x - @block_image.width / 2.0,
                      y - @block_image.height / 2.0,
                      z_pos = 1)
  end
end