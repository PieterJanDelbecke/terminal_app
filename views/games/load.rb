
module Views
  module Games
    def self.load_player
        puts "Welcome back general, we were waiting for you!"
        puts "What is your name? "
        name = gets.chomp.downcase.strip
    end
  end
end