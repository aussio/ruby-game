# frozen_string_literal: true

require_relative 'window'

class Server < Window

  def initialize(**options)
    puts "Running as server"
    super
  end

  def tick
    update
    true
  end
end
