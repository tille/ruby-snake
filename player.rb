class Player
  attr_reader :score

  VELOCITY = 20

  def initialize(window)
    @snake_block = Gosu::Image.new(window, "media/snake_block.jpg", false)
    @player.warp(320, 240)
    @score = 0
  end

  def snake
    [@snake_block]
  end

  def warp(x, y)
    @x, @y = x, y
  end
  private :warp

  def move
    # pending to move each snake image
  end

  def draw
    # pending
  end

  # def collect_block?(block)
  #   distance_to_collision = block.height / 2.0 + player.head / 2.0
  #   block_distance = Gosu::distance(@x, @y, player.head.x, player.head.x)
  #   block_distance < distance_to_collision
  # end

end