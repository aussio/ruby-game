# frozen_string_literal: true

require 'optparse'
require 'gosu'
# Autoload lib
Dir["lib/**/*.rb"].each { |file| require_relative file }

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby main.rb [options]"

  opts.on("-s", "--server", "Run as server") do |o|
    options[:server] = o
  end
end.parse!

if options[:server]
  window_class = Server
else
  window_class = Client
end

w = window_class.new(
  width: SCREEN_SIZE_X,
  height: SCREEN_SIZE_Y,
  caption: "Gosu Game",
  resizable: true,
  update_interval: 1000 / TICKS_PER_SECOND,
  server: options[:server],
)

w.show