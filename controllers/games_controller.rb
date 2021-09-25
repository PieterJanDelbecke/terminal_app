require "./models/game"
require "./views/games/new"
require "./views/games/challenge"

class GamesController

    def new
        game = Game.new
        p game
        Views:: Games.new game
        p game
        Challenge.play game
    end
end