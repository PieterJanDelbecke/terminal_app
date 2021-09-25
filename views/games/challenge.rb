module Challenge
    def self.play (game)
        cities = ["Omaha Beach", "Lille", "Paris", "Bastogne", "Antwerp" ,"Brussels" ,"Cologne" ,"Hannover" ,"Berlin" ,"Buncker"]
        level_array = ["beginner","medium","pro"]
        puts "Hello General: #{game.name}" 
        puts "You are a #{game.level}"
        puts "You have #{game.platoon} platoons under your command"
        puts "you are currently in #{cities[game.stage]}"
    end
end