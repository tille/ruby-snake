module Keyboard

  def handle_keys
    if button_down? Gosu::KbLeft
      @player.turn('left') unless @player.direction == 'right'
    end
    if button_down? Gosu::KbRight
      @player.turn('right') unless @player.direction == 'left'
    end
    if button_down? Gosu::KbUp
      @player.turn('up') unless @player.direction == 'down'
    end
    if button_down? Gosu::KbDown
      @player.turn('down') unless @player.direction == 'up'
    end
  end
end