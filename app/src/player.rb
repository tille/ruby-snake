class Player
  attr_accessor :score, :snake, :window, :direction, :beep
  private :window, :snake, :beep

  GAP = 100

  def initialize(window)
    self.beep = Gosu::Sample.new(window, "media/Beep.wav")
    self.score = 0
    self.snake = Array.new
    self.window = window
    self.direction = 'right'
    @callbacks = []
    @loaded_blocks = load_blocks
    initialize_snake
  end

  def load_blocks
    # since create blocks in linking time
    # reduce game performace, we'll use this blocks array
    # to load blocks at the beginning and just move them
    # at collect a new block
    (0..40).inject [] do |memo, n|
      memo.push Block.new(window, {x: 0, y: 0})
    end
  end

  def initialize_snake
    block_1 = Block.new(window, { x: 320, y: 240 })
    block_2 = Block.new(window, { x: 300, y: 240 })
    block_3 = Block.new(window, { x: 280, y: 240 })
    snake.push(block_1, block_2, block_3)
  end

  def turn_right
    self.direction = 'right'
  end

  def turn_left
    self.direction = 'left'
  end

  def turn_up
    self.direction = 'up'
  end

  def turn_down
    self.direction = 'down'
  end

  def collision? target
    dist = Gosu::distance(snake_head.x, snake_head.y,
                          target.x, target.y)
    max_distance = (snake_head.width / 2.0 + target.width / 2.0)

    if dist < max_distance
      beep.play
      self.score += 10

      # marks the block to be collected
      @callbacks.push({
        x: target.x,
        y: target.y
      })
      target.relocate
    end
  end

  def snake_head
    snake.first
  end

  def snake_tail
    snake.last
  end

  # moves snake each 100 milliseconds
  def auto_move
    sec = Gosu::milliseconds / GAP
    if sec != @current_sec
      @current_sec = sec
      step_up
    end
  end

  def step_up
    add_snake_block if collect_block?
    move
  end

  def add_snake_block
    new_block = @loaded_blocks.pop
    new_block.locate_at({
      x: snake_tail.x, y: snake_tail.y
    })
    snake.push(new_block)
  end

  def collect_block?
    old_size = @callbacks.size
    new_size = @callbacks.delete_if do |callback|
      snake_tail.x == callback[:x] &&
      snake_tail.y == callback[:y]
    end.size
    old_size != new_size
  end

  def move_head
    snake_head.move( direction )
  end
  private :move_head

  def move
    (0..snake.size-2).each do |i|
      pos = snake.size-i-1
      new_pos = {
        x: snake[pos-1].x,
        y: snake[pos-1].y
      }
      snake[pos].locate_at(new_pos)
    end
    move_head
  end

  def draw
    snake.each do |snake_block|
      snake_block.draw
    end
  end
end