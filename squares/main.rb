# frozen_string_literal: true

require_relative './lib/Window.rb'

Window.new(
  width: SCREEN_SIZE_X,
  height: SCREEN_SIZE_Y,
  caption: "Gosu Game",
  resizable: true
).show