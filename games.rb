
require './controllers/games_controller'
games_controller = GamesController.new

# begin
    print "What do you want to do? (new, quit): "  # load, leaderboard
    input = gets.chomp.downcase.strip
    option = input

    case option
    when 'new'
        puts "***new***"
        games_controller.new
    end
# end
# end until ['quit'].include? option