require 'tty-table'
require 'colorize'
require_relative 'layout.rb'

module Views
    module Games
        def self.index(games)
            header
            return puts "No games" if games.empty?

            leader = leader games
            puts "\nThe current leader is " + "#{leader[1].capitalize}".yellow + ", with a score of " + "#{leader[0]}".yellow
            puts

            headers = %w[player level stage platoons score]
            rows = table_rows_for games
            table = TTY::Table.new headers, rows
            puts table.render(:ascii)
        end

        def self.table_rows_for(games)
                games.map do |game|
                    [game.name, game.level, game.stage, game.platoons, game.score]
                end
        end

        def self.leader(games)
            leader = [0,""]
            games.each do |game|
                if game.score > leader[0]
                    leader[0] = game.score
                    leader[1] = game.name
                end
            end
            leader
        end


        def self.table_list_names(games)
            puts "\nWelcome back general, we were waiting for you!"
            puts "\nSee below the list of all the excisting players: "
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