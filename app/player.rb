class Player < Base
  attr_accessor :score, :direction, :gap, :game_over

  def_delegator :@snake, :first, :snake_head
  def_delegator :@snake, :last, :snake_tail

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
    # moves each block to its predecessor's position
    (1..@snake.size-1).each do |i|
      pos = @snake.size-i
      @snake[pos].locate_at({
        x: @snake[pos-1].x,
        y: @snake[pos-1].y
      })
    end
  end
  private :move_body

  def draw
    @snake.each{ |snake_block| snake_block.draw }
  end
end
