require 'gosu'
Dir["./src/*.rb"].each { |file| require file }

class GameWindow < Gosu::Window
  attr_accessor :player, :target
  include Keyboard
  include UI

  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake by T!ll3"
    self.player = Player.new(self)
    self.target = Block.new(self)
  end

  def update
    handle_keys
    player.auto_move
  end

  def draw
    player.draw
    player.collect_block(target)
    draw_score(self, player)
    target.draw
  end
end

window = GameWindow.new
window.show