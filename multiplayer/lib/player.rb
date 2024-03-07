# frozen_string_literal: true

class Player
  attr_reader :x, :y
  attr_accessor :score

  def initialize(color:, inputs:)
    @body = Gosu::Image.new("#{MEDIA_PATH}/#{color}/texture_05.png", rect: [0, 0, PLAYER_SIZE, PLAYER_SIZE], tileable:
      false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @inputs = inputs
  end

  def draw
    center = 0.5
    body_scale = 1
    cone_scale = body_scale * 0.75
    # Draws the "cone" of the rocket in front of the ship at all times.
    # Translates it be in front of whatever angle the ship is going.
    @body.draw_rot(@x + Gosu.offset_x(@angle, @body.width / 2),
                   @y + Gosu.offset_y(@angle, @body.height / 2),
                   ZOrder::PLAYER,
                   @angle + 45, center, center, cone_scale, cone_scale)
    # Body
    @body.draw_rot(@x, @y, ZOrder::PLAYER, @angle, center, center, body_scale, body_scale)
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def player_input_movement
    if Gosu.button_down? @inputs::LEFT
      self.turn_left
    end
    if Gosu.button_down? @inputs::RIGHT
      self.turn_right
    end
    if Gosu.button_down? @inputs::UP
      self.accelerate
    end
    if Gosu.button_down? @inputs::DOWN
      self.accelerate(true)
    end
    self.move
  end

  private

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate(backwards = false)
    power = 0.5
    power = -power if backwards
    @vel_x += Gosu.offset_x(@angle, power)
    @vel_y += Gosu.offset_y(@angle, power)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= SCREEN_SIZE_X
    @y %= SCREEN_SIZE_Y

    @vel_x *= 0.95
    @vel_y *= 0.95
  end
end