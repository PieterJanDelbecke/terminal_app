require 'tty-prompt'
require './views/errors/data_entry'

module Views
  module Games
    def self.new(game)
      game.name = new_player_name
      game.level = TTY::Prompt.new.select('Select your level: ') do |menu|
      menu.choice 'Beginner', 0
      menu.choice 'Advanced', 1
      menu.choice 'Pro', 2
      end
    end

  end
end