
require './controllers/games_controller'

require 'tty-font'
require 'rainbow'
require 'colorize'
require './views/games/layout'

games_controller = GamesController.new

start_up = true

def type_writer
    yield.each_char { |c| putc c; $stdout.flush; sleep 0.05 }
end

header                       # displays D-Day logo

begin
    if start_up                     #type writer, only at start up
        start_up = false
        type_writer do
            "\n6th of June 1944 in German occupied Europe...".green + \
            "\nToday is D-Day and you are about to land on Omaha Beach in Normandy, France".green + \
            "\nYou are a general in the American army and you are in charge of the liberation of the European continent".green + \
            "\n\nConquer city by city back from the Germans until you make it to Berlin, Germany".green + \
            "\nOnce in Berlin go to Hitlers bunker and eliminate him".green + \
            "\n\nTake the following route to Berlin: ".green + \
            "\nOmaha Beach => Lille => Paris => Bastogne => Antwerp => Brussels => Cologne => Hannover => Berlin".green 
        end
    end

    option = TTY::Prompt.new.select("\n\nWhat do you want to do?: ") do |menu|  # Prompt to choose game features
        menu.choice 'New Game', 'new'
        menu.choice 'Load Game', 'load'
        menu.choice 'Scoreboard', 'list'
        menu.choice 'Help', 'help'
        menu.choice 'Quit', 'quit'
            end    

    case option
    when 'new'
    games_controller.new
    when 'load'
    games_controller.load
    when 'list'
    games_controller.score
    when 'help'
    games_controller.help
    end
end until ['quit'].include? option

