require 'gosu'
require './src/player.rb'
require './src/block.rb'

class GameWindow < Gosu::Window
  attr_accessor :player

  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake by T!ll3"
    self.player = Player.new(self)
  end

  def handle_keys
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft
      player.turn_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight
      player.turn_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpUp
      player.turn_up
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpDown
      player.turn_down
    end
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