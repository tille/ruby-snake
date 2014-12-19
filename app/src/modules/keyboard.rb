module Keyboard

  def handle_keys
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft
      player.turn_left unless player.direction == 'right'
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight
      player.turn_right unless player.direction == 'left'
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpUp
      player.turn_up unless player.direction == 'down'
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpDown
      player.turn_down unless player.direction == 'up'
    end
  end
end