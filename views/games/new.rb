require 'tty-prompt'
require './views/errors/data_entry'
require './views/games/layout'


module Views
  module Games
    def self.new(game)                   # displays the prompt where you can select the difficulty level of the game - new game
      header
      game.name = new_player_name        # reads in new players name and entry gets checked if correct (data_entry.rb)
      
      game.level = TTY::Prompt.new.select("\nSelect your level: ") do |menu|      # displays prompt
      menu.choice 'Beginner', 0
      menu.choice 'Advanced', 1
      menu.choice 'Pro', 2
      end
    end

  end
end