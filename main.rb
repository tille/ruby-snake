require 'gosu'
require './src/player.rb'
require './src/block.rb'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake by T!ll3"
    @player = Player.new(self)
  end

  def update
    # TODO: execute @player.move each second
  end

  def draw
    @player.draw
  end
end

window = GameWindow.new
window.show