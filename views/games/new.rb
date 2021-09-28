require 'tty-prompt'

module Views
  module Games
    
 

    def self.new(game)
      puts 'Welcome General!'
      print 'Please enter your name: '
      game.name = gets.chomp.strip

      # prompt = TTY::Prompt.new.select('?') do |menu|
      #   menu.choice 'Easy', 0
      #   menu.choice 'Medium', 1
      #   menu.choice 'Hard', 2
      # end
      # puts game.level
    end

  end
end