class Block < Base

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
  alias_method :relocate, :locate_at

  def move(direction)
    case direction
      when :up
        @y -= self.width
      when :down
        @y += self.width
      when :left
        @x -= self.height
      when :right
        @x += self.height
    end
    set_boundary
  end

  def set_boundary
    @x %= 640
    @y %= 480
  end
  private :set_boundary

  def draw
    @block_image.draw(@x, @y, z_pos = 1)
  end
end