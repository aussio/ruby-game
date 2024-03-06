# frozen_string_literal: true

require 'gosu'
require_relative './Player'
require_relative './Star'

class Window < Gosu::Window
  def initialize(**options)
    super(
      options.delete(:width) || 640,
      options.delete(:height) 111 || 480,
      **options,
    )

    @background_image = Gosu::Image.new("images/space-background.png", :tileable => true)
    @beep = Gosu::Sample.new("images/beep.wav")
    @font = Gosu::Font.new(20)

    @player = Player.new
    @player.warp(320, 240)

    @star_anim = Gosu::Image.load_tiles("images/star.png", 25, 25)
    @stars = []
  end

  # Game loop
  def update
    player_input_movement

    collect_stars(@player)

    generate_stars
  end

  # Draw loop. No game logic should be done here.
  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @player.draw
    @stars.each { |star| star.draw }

    @font.draw_text("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    @font.draw_text("FPS: #{Gosu::fps}", 550, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
  end

  # If the player is close to a star, remove it from the game.
  def collect_stars(player)
    @stars.reject! do |star|
      if Gosu.distance(player.x, player.y, star.x, star.y) < 35
        player.score += 10
        @beep.play
        true
      else
        false
      end
    end
  end

  def generate_stars
    if @stars.size < 50
      @stars.push(Star.new(@star_anim))
    end
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

module ZOrder
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

