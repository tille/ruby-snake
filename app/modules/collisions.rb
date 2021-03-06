module Collisions

  def collision?(obj_1, obj_2)
    dist = Gosu::distance(
      obj_1.x, obj_1.y,
      obj_2.x, obj_2.y)

    max_distance = obj_1.width/2.0 + obj_2.width/2.0
    dist < max_distance
  end

  def collision_snake?
    !!(1..@snake.size-1).detect do |i|
      collision?(@snake[i], snake_head)
    end
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
