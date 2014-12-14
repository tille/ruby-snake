class Player
  attr_accessor :score, :snake, :window, :direction
  private :window, :snake

  GAP = 100

  def initialize(window)
    self.score = 0
    self.snake = Array.new
    self.window = window
    self.direction = 'right'
    initialize_snake
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

  # moves snake each 100 milliseconds
  def auto_move
    sec = Gosu::milliseconds / GAP
    if sec != @current_sec
      @current_sec = sec
      self.move
    end
  end

  def move_head
    snake.first.move( direction )
  end
  private :move_head

  def move
    (0..snake.size-2).each do |i|
      pos = snake.size-i-1
      snake[pos].locate_at( snake[pos-1].x, snake[pos-1].y )
    end
    move_head
  end

  def draw
    snake.each do |snake_block|
      snake_block.draw
    end
  end
end