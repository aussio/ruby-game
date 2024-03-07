# frozen_string_literal: true

require_relative 'window'

class Client < Window
  def initialize(**options)
    puts "Running as client"
    super
  end
end
