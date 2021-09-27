require 'tty-table'

module Views
    module Games
        def self.index(games)
            return puts "No games" if games.empty?

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
    end
end