require 'gosu'
Dir["./src/*.rb"].each { |file| require file }
Dir["./src/modules/*.rb"].each { |file| require file }

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
    player.collision(target)
    game_over(self, player) if player.collision_snake?
    draw_score(self, player)
    target.draw
    player.draw
  end
end

window = GameWindow.new
window.show