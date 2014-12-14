class Player
  attr_reader :score, :snake, :window

  VELOCITY = 20

  def initialize(window)
    @score = 0
    @snake = Array.new
    @window = window
    initialize_snake
  end

  def initialize_snake
    block_1 = Block.new(window, 320, 240)
    block_2 = Block.new(window, 300, 240)
    block_3 = Block.new(window, 280, 240)
    snake.push(block_1, block_2, block_3)
  end

  def move
    snake.each do |snake_block|
      snake_block.move('right')
    end
  end

  def draw
    snake.each do |snake_block|
      snake_block.draw
    end
  end
end