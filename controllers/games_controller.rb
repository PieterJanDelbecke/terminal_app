require './models/game'
require './views/games/new'
require './views/games/load'
require './views/games/challenge'
require './views/games/index.rb'

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
        games = Game.all
        list_of_names = Views::Games.table_list_names(games)
        name = Views::Games.load_player(list_of_names)
        game = Game.load(name)
        option = Challenge.play game
        case option
        when 'y'
           option = Challenge.play game
        end until ['n'].include? option
        Game.save_loaded game
    end

    def score
        games = Game.all
        Views::Games.index(games)
    end
end

