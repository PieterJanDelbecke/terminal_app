require 'tty-prompt'

module Views
  module Games
    def self.new(game)
      puts "\nWelcome General!"
      print 'Please enter your name: '
      game.name = gets.chomp.downcase.strip

      game.level = TTY::Prompt.new.select('Select your level: ') do |menu|
      menu.choice 'Beginner', 0
      menu.choice 'Advanced', 1
      menu.choice 'Pro', 2
      end
    end

  end
end