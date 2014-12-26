module Loader

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
end