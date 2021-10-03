require './models/game'
require './views/games/challenge'
require './views/games/index'
require 'minitest/autorun'


describe "when first created" do                        # Testing when a new instance of the Game class get initiated.
    it "game.name is empty" do                          # It tests if the instance variable game.name contains an empty string 
    game = Game.new                                     # after it was initilalised.
    expect(game.name).must_equal ""
    end
end


describe "when name is entered" do                  
    it "player boris" do                            
        game = Game.new                                 # This test tests if the instance variable game.name is equal to 'boris'
        game.name = 'boris'                             # after that it was first initialised and was assigned the string 'boris' to it.
        expect(game.name).must_equal 'boris'         
        expect(game.score).must_equal 100               # The second test tests if the game.score instace variable is equal to 100.
    end                                                 # It should be 100 as it got this value assigned at initialisation of the instance.
end

describe "when list is displayed do" do                 #This test verifies if the list of saved names contains the name 'jack'
    it "adds names players to array" do
        game = Game.new                                 # initialises the game instace of the Game class
        game.name = 'jack'                              # assigns the string 'jack' to the instance variable game.name
        Game.save game                                  # the instace game gets save with YAML to a file
        games = Game.all                                # the database gets loaded
        names = Views::Games.table_list_names games     # iterates through the database and makes a list of the names of all the players
        expect(names).must_include 'jack'               # tests if the string jack is amogst all the player names.
    end
end
