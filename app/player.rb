class Player
  attr_accessor :score, :direction, :gap, :game_over

  def initialize(window)
    @beep = Gosu::Sample.new(window, "app/media/Beep.wav")
    @score = 0
    @snake = Array.new
    @direction = 'right'
    @gap = 80
    @callbacks = []
    @loaded_blocks = load_blocks(window)
    @game_over = false
    initialize_snake(window)
  end

  def load_blocks(window)
    # since create blocks in linking time
    # reduce the game-performace, we'll use an array
    # to load blocks and move them
    # at collect new blocks
    (0..40).inject [] do |memo, n|
      memo.push Block.new(window, {x: 0, y: 0})
    end
  end
  private :load_blocks

  def initialize_snake(window)
    block_1 = Block.new(window, { x: 320, y: 240 })
    block_2 = Block.new(window, { x: 300, y: 240 })
    block_3 = Block.new(window, { x: 280, y: 240 })
    @snake.push(block_1, block_2, block_3)
  end
  private :initialize_snake

  def turn(direction)
    @direction = direction
  end

  def collision?(obj_1, obj_2)
    dist = Gosu::distance(
      obj_1.x, obj_1.y,
      obj_2.x, obj_2.y)

    max_distance = obj_1.width/2.0 + obj_2.width/2.0
    dist < max_distance
  end
  private :collision?

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

  # TODO: has a weird bug
  def collision_snake?
    (1..@snake.size-1).each do |i|
      snake_block = @snake[i]
      if snake_head.x == snake_block.x &&
        snake_head.y == snake_block.y
        return true
      end
    end
    return false
  end

  def snake_head
    @snake.first
  end

  def snake_tail
    @snake.last
  end

  # moves snake each 100 milliseconds
  def auto_move
    if @game_over == false && current_sec != @last_sec
      @last_sec = current_sec
      move_and_collect
    end
  end

  def current_sec
    Gosu::milliseconds / @gap
  end

  def move_and_collect
    add_snake_block if collect_block?
    move
  end
  private :move_and_collect

  def add_snake_block
    new_block = @loaded_blocks.pop
    new_block.locate_at({
      x: snake_tail.x, y: snake_tail.y
    })
    @snake.push(new_block)
  end
  private :add_snake_block

  def collect_block?
    old_size = @callbacks.size
    new_size = @callbacks.delete_if do |callback|
      snake_tail.x == callback[:x] &&
      snake_tail.y == callback[:y]
    end.size
    old_size != new_size
  end

  def move_head
    snake_head.move( @direction )
  end
  private :move_head

  def move
    move_body
    move_head
  end
  private :move

  def move_body
    # moves each block to its
    # predecessor's position

    (0..@snake.size-2).each do |i|
      pos = @snake.size-i-1
      new_pos = {
        x: @snake[pos-1].x,
        y: @snake[pos-1].y
      }
      @snake[pos].locate_at(new_pos)
    end
  end
  private :move_body

  def draw
    @snake.each{ |snake_block| snake_block.draw }
  end
end
