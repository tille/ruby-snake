# class Block
#   attr_reader :x, :y, :taken

#   def initialize
#     @block_image = Gosu::Image.new(self, "media/snake_block.jpg")
#     self.taken = false
#     situate
#   end

#    def situate
#      self.x = rand * 640
#      self.y = rand * 480
#    end
#    private :warp

#   def move
#     situate
#     self.taken = true
#   end

#   def draw
#     block_image.draw(x - block_image.width / 2.0,
#                      y - block_image.height / 2.0,
#                      z_pos = 1, 1, 1, Color::WHITE, :add)
#   end
# end