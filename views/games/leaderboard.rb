require 'tty-table'

module Views
    module Games
        def self.index(games)
            return puts "No games" if games.empty?

            leader = leader games
            puts "\nThe current leader is #{leader[1]}, with a score of #{leader[0]}"
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

    end
end