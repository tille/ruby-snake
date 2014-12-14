require 'gosu'

module ZOrder
  Background, Stars, Player, UI = *0..3
end

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

# class Block
#   attr_reader :x, :y, :taken

#   def initialize
#     @block_image = Gosu::Image.new(self, "media/snake_block.jpg")
#     warp
#     @taken = false
#   end

#    def warp
#      @x = rand * 640
#      @y = rand * 480
#    end
#    private :warp

#   def move
#     warp
#     @taken = true
#   end

#   def draw
#     img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
#         ZOrder::Block, 1, 1, Color::WHITE, :add)
#   end
# end

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake by T!ll3"

    @player = Player.new(self)
    # @block = Block.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    @player.move
  end

  def draw
    @player.draw
    # @block.draw
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end
end

window = GameWindow.new
window.show