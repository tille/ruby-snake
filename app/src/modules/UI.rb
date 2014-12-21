module UI
  private
    FONT_SIZE = 20

  def default_font(window)
    Gosu::Font.new(window, Gosu::default_font_name, FONT_SIZE)
  end

  public
    def draw_score(window, player)
      score_msg = "Score: #{player.score}"
      font = default_font(window)
      font.draw(score_msg, x_pos = 10, y_pos = 10,
                z_pos = 1, 1.0, 1.0, 0xffffff00)
    end

    def game_over(window, player)
      player.gap = 1000000
      player.game_over = true
      message = "Game Over"
      default_font(window).draw(message,
        x_pos = 640/2.0,
        y_pos = 480/2.0,
        z_pos = 1,
        1.0,
        1.0,
        0xffffff00)
    end
end