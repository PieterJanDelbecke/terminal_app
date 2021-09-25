module Views
  module Games
    def self.new(game)
      puts 'Welcom General!'
      print 'Name: '
      game.name = gets.chomp.strip
    end
  end
end
