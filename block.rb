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