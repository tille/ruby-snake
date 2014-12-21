require 'gosu'
require 'require_all'

require_all 'app'

class GameWindow < Gosu::Window
  include Keyboard
  include UI

  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake by T!ll3"
    @player = Player.new(self)
    @target = Block.new(self)
  end

  def update
    handle_keys
    @player.auto_move
  end

  def draw
    @player.collision(@target)
    game_over(self) if @player.collision_snake?
    draw_score(self)
    @target.draw
    @player.draw
  end
end

window = GameWindow.new
window.show