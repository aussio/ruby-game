# frozen_string_literal: true

require 'gosu'
require_relative './Constants.rb'
require_relative './Player.rb'

class Window < Gosu::Window
  def initialize(**options)
    super(
      options.delete(:width) || 640,
      options.delete(:height) || 480,
      **options,
    )

    @background_image = Gosu::Image.new("#{MEDIA_PATH}/Dark/texture_01.png", :tileable => false)
    @beep = Gosu::Sample.new("media/beep.wav")
    @font = Gosu::Font.new(FONT_SIZE)

    @player1 = Player.new(color: 'Green', inputs: KeyboardInputs::ASWD)
    @player2 = Player.new(color: 'Orange', inputs: KeyboardInputs::ArrowKeys)
    @player1.warp(120, 240)
    @player2.warp(520, 240)
  end

  # Game loop
  def update
    @player1.player_input_movement
    @player2.player_input_movement
  end

  # Draw loop. No game logic should be done here.
  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @font.draw_text("P1 Score: #{@player1.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    @font.draw_text("P2 Score: #{@player2.score}", 10, 30, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    @font.draw_text("FPS: #{Gosu::fps}", SCREEN_SIZE_X - 90, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)

    @player1.draw
    @player2.draw
  end
end