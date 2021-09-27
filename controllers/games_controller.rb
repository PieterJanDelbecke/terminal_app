require './models/game'
require './views/games/new'
require './views/games/challenge'

class GamesController
  
    def new
        game = Game.new
        Views::Games.new game
        Challenge.play game
        puts "#{"--"*50}"
        Game.save game
        puts "#{"--"*15} END #{"--"*15}"
    end

    def load
        game = Game.load("Tom")
        puts "************ Loaded game *************"
        p game
        puts "**************************************"
        Challenge.play game
        puts "#{"--"*50}"
        Game.save game
        puts "#{"--"*15} END #{"--"*15}"
    end

end

