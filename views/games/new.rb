module Views
  module Games
    def self.new(game)
      puts 'Welcome General!'
      print 'Please enter your name: '
      game.name = gets.chomp.strip
    end
  end
end
