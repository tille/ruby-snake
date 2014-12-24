require 'gosu'
require 'forwardable'
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
    game_over if @player.collision_snake?
  end

  def draw
    @player.collision(@target)
    @player.draw
    @target.draw
    draw_score(self)
    draw_game_over(self) if game_over?
  end
end

window = GameWindow.new
window.show