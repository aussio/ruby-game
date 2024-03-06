# frozen_string_literal: true

require_relative './lib/Window.rb'
require_relative './lib/Constants.rb'

w = Window.new(
  width: SCREEN_SIZE_X,
  height: SCREEN_SIZE_Y,
  caption: "Gosu Game",
  resizable: true,
  update_interval: 1000 / TICKS_PER_SECOND,
)

w.show