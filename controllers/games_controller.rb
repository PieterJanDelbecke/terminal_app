require './models/game'
require './views/games/new'
require './views/games/load'
require './views/games/challenge'
require './views/games/leaderboard.rb'

class GamesController
  
    def new
        game = Game.new
        Views::Games.new game
        option = Challenge.play game
        case option
        when 'y'
           option = Challenge.play game
        end until ['n'].include? option
        Game.save game
    end

    def load
        name = Views::Games.load_player
        game = Game.load(name)
        puts "************ Loaded game *************"
        p game
        puts "**************************************"
        Challenge.play game
        puts "#{"--"*50}"
        Game.save_loaded game
        puts "#{"--"*15} END #{"--"*15}"
    end

    def score
        games = Game.all
        Views::Games.index(games)
    end

    def destroy
        Game.destroy "Bram"
    end
end

