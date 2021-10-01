require './models/game'
require './views/games/new'
require './views/games/load'
require './views/games/help'
require './views/games/challenge'
require './views/games/index'
require 'colorize'

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
        if game.over 
            puts "\nThis game is over, you lost the war".red
        elsif game.finished
            puts "\nThis game is finished, you won the war".red
        else
            option = Challenge.play game
            case option
            when 'y'
               option = Challenge.play game
            end until ['n'].include? option
            Game.save_loaded game
        end
    end

    def score
        games = Game.all
        Views::Games.index(games)
    end

    def help
        Views::Games.help
    end
end


