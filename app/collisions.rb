module Base
  class Collisions

    def collision(target)
      if collision?(snake_head, target)
        @beep.play
        @score += 10

        # marks the block to be collected
        @callbacks.push({
          x: target.x,
          y: target.y
        })
        target.relocate
      end
    end

    def collision?(obj_1, obj_2)
      dist = Gosu::distance(
        obj_1.x, obj_1.y,
        obj_2.x, obj_2.y)

      max_distance = obj_1.width/2.0 + obj_2.width/2.0
      dist < max_distance
    end
    private :collision?

    def collision_snake?
      # (1..@snake.size-1).inject false do |memo, i|
      #   memo = true if collision?( @snake[i], snake_head )
      # end

      (1..@snake.size-1).each do |i|
        snake_block = @snake[i]
        return true if collision?(snake_block, snake_head)
      end
      false
    end

    def collect_block?
      old_size = @callbacks.size
      new_size = @callbacks.delete_if do |callback|
        snake_tail.x == callback[:x] &&
        snake_tail.y == callback[:y]
      end.size
      old_size != new_size
    end
    private :collect_block?

  end
end