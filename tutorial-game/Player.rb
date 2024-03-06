# frozen_string_literal: true

require 'gosu'

class Player
  attr_reader :x, :y
  attr_accessor :score

  def initialize
    @image = Gosu::Image.new("images/starfighter.bmp")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def score
    @score
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    power = 0.5
    @vel_x += Gosu.offset_x(@angle, power)
    @vel_y += Gosu.offset_y(@angle, power)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end