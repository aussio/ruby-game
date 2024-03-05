# frozen_string_literal: true

require 'gosu'

class Star
  attr_reader :x, :y, :animation

  def initialize(animation)
    @animation = animation
    @color = Gosu::Color::BLACK.dup
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = rand * 640
    @y = rand * 480
  end

  def draw
    frame_duration = 100
    frame = (Gosu.milliseconds / frame_duration) % @animation.size
    img = @animation[frame]
    img.draw(
      @x - img.width / 2.0,
      @y - img.height / 2.0,
      ZOrder::STARS, 1, 1, @color, :add,
    )
  end
end