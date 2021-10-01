require 'tty-table'
require 'colorize'
require_relative 'layout.rb'

module Views
    module Games
        def self.index(games)                   # displays who is currently is the leader in the game  - scoreboard
            header
            return puts "No games" if games.empty?

            leader = leaders games
            puts "\nThe current leader is " + "#{leader[:name].upcase}".yellow + ", with "+ "#{leader[:platoons]}".yellow + " platoons and a score of " + "#{leader[:score]}".yellow
            puts

            headers = %w[Player Level Status Stage Platoons Score]
            rows = table_rows_for games
            table = TTY::Table.new headers, rows
            puts table.render(:ascii)
        end

        def self.leaders(games)                 #populates the hash used for displaying the leader - scoreboard
            leader = {score: 0, name: '', platoons: 0}
            games.each do |game|
                if (game.score > leader[:score])
                    leader[:score] = game.score
                    leader[:name] = game.name
                    leader[:platoons] = game.platoons
                end
            end
            leader
        end

        def self.table_rows_for(games)          # displays the table with all the players and their results - scoreboard
            cities = ['','Omaha Beach', 'Lille', 'Paris', 'Bastogne', 'Antwerp', 'Brussels' ,'Cologne', 'Hannover', 'Berlin', 'Hitlers Bunker','']
            level = %w[beginner advanced pro]
            games.map do |game|
                game_city = cities[game.stage + 1]
                game_level = level[game.level]
                if game.finished
                    game_status = 'WAR WON'.red
                elsif game.over
                    game_status = 'GAME OVER'.red
                else
                    game_status = ''
                end
                [game.name, game_level,game_status, game_city, game.platoons, game.score]
            end
        end


        def self.table_list_names(games)  # displays the list of existing players when load feature is selected - load game
            header
            puts "\nWelcome back general, we were waiting for you!"
            puts "\nSee below the list of all the excisting generals: "
            puts
            list_of_names = []
            games.each do |game|
                puts game.name.capitalize.yellow
                list_of_names << game.name
            end
            list_of_names
        end


    end
end