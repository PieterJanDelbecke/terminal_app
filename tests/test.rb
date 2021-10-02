require './models/game'
require './views/games/challenge'
require './views/games/index'
require 'minitest/autorun'


describe "when first created" do
    it "game.name is empty" do
    game = Game.new
    expect(game.name).must_equal("")
    end
end


describe "when name is entered" do
    it "player boris" do
        game = Game.new
        game.name = 'boris'
        expect(game.name).must_equal 'boris'
        expect(game.score).must_equal 100
    end
end

describe "when list is displayed do" do
    it "adds names players to array" do
        game = Game.new
        game.name = 'jack'
        Game.save game
        games = Game.all
        names = Views::Games.table_list_names(games)
        expect(names).must_include 'jack'
    end
end
