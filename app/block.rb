class Block
  extend Forwardable

  attr_reader :x, :y
  def_delegators :@block_image, :width, :height

  def initialize(window, args = {})
    path = "app/media/block_3.png"
    @block_image = Gosu::Image.new(window, path, false)
    locate_at(args)
  end

  def locate_at(args = {})
    @x = args[:x] || (rand * 32).to_i * self.width
    @y = args[:y] || (rand * 24).to_i * self.height
  end

  def relocate
    locate_at
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
    @block_image.draw(@x, @y, z_pos = 1)
  end
end