module Common
  include Collisions

  private
    def game_over?
      @player.game_over == true
    end

    def is_playing?
      game_over? == false && time_to_advance? == true
    end

    def time_to_advance?
      current_time != @last_movement_time
    end

    def snake_auto_movement
      if is_playing?
        @last_movement_time = current_time
        @player.move_and_collect
      end
    end

    def current_time
      Gosu::milliseconds / @player.gap
    end

    def snake_head
      @player.snake_head
    end

    def collect_block(target)
      @player.collect_block target
    end

    def game_over
      @player.gap = 2**30 # infinity
      @player.game_over = true
    end
end