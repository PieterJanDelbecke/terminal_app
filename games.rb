
require './controllers/games_controller'
games_controller = GamesController.new

# begin
print 'What do you want to do? (new, load, list, delete, quit): ' # leaderboard
input = gets.chomp.downcase.strip
option = input

case option
when 'new'
games_controller.new
when 'load'
games_controller.load
when 'list'
games_controller.score
when 'delete'
games_controller.destroy
end    
# end until ['quit'].include? option
