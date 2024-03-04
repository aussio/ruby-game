# frozen_string_literal: true

require 'gosu'
require './player'

class Window < Gosu::Window
  def initialize(**options)
    super(
      options.delete(:width) || 640,
      options.delete(:height) || 480,
      **options,
    )

    @background_image = Gosu::Image.new("images/space-background.png", :tileable => true)

    @player = Player.new
    @player.warp(320, 240)
  end

  # Game loop
  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    @player.move
  end


  # Draw loop. No game logic should be done here.
  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Window.new(
  width: 640,
  height: 400,
  caption: "Gosu Game",
  resizable: true
).show