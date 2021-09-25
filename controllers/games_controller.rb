require './models/game'
require './views/games/new'
require './views/games/challenge'

class GamesController
  def new
    game = Game.new
    Views::Games.new game
    Challenge.play game
    puts '------------------'
    p game
    puts '----- END --------'
  end
end
