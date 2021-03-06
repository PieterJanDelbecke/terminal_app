require './views/games/layout'
require './views/errors/error_handling'
require 'colorize'

module Views
  module Games                              # reads in the name of the player when he/she wants to load an existing game - load game
    def self.load_player(list_of_names)
        puts "\nEnter your name: "
        name = gets.chomp.downcase.strip
        validate_load_name(name,list_of_names)
    rescue InvalidLoadName => e
      puts "Invalid name: error details: #{e.message}".red
      retry
    end
  end
end