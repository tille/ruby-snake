require 'gosu'
Dir["./src/*.rb"].each { |file| require file }

class GameWindow < Gosu::Window
  attr_accessor :player
  include Keyboard

  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake by T!ll3"
    self.player = Player.new(self)
  end

  def update
    handle_keys
    player.auto_move
  end

  def draw
    player.draw
  end
end

window = GameWindow.new
window.show