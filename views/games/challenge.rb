require 'colorize'
require 'tty-font'
require 'tty-spinner'
require './views/errors/data_entry'
require_relative './dice_game'


module Challenge
    def self.play(game)
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        # bar = TTY::ProgressBar.new("dice is rolling... [:bar]",total: 20)
        cities = ['Omaha Beach', 'Lille', 'Paris', 'Bastogne', 'Antwerp', 'Brussels', 'Cologne', 'Hannover',
        'Berlin', 'Hitlers Bunker']
        level_array = %w[Beginner Advanced Pro]
        system('clear')

        puts "General: " + "#{game.name.upcase}".yellow
        puts "Level: " + "#{level_array[game.level]}".yellow
        puts "\nScore: " + "#{game.score}".yellow
        puts "Platoons under your command: " + "#{game.platoons}".yellow
        puts "You are currently in: " + "#{cities[game.stage]}".green
        puts "\n#{'**'*30}"
        
        cities.each_with_index do |item,index|
                if game.stage == index
                    print "  => #{item}".green
                elsif game.stage > index
                    print "=> #{item}".blue
                else
                    print "=> #{item}".red
                end
                puts
        end
        puts "\n#{'**'*30}"

        difficulty = 4 + game.level
        input = dice_number(difficulty)
        result = battle(game,difficulty,input)

        if result        # won the battle
            game.stage += 1
            game.platoons += 1
            game.score += 20
            puts "\nAWESOME!   You won the battle in: " +  "#{cities[game.stage-1]}".yellow
            puts "\nYou earned an extra platoon and accumuleted an extra 20 points"
            puts "Platoons: " + "#{game.platoons}".yellow
            puts "\nlet's go to:"
            puts pastel.green(font.write("#{cities[game.stage]}"))
        else               # lost the battle
            game.platoons -=1
            game.score -= 5
            puts "\nNoooo you lost the fights, you lost the battle in: #{cities[game.stage]}!"
            puts "You lost a platoon."
            puts "Platoons: #{game.platoons}"
            if game.stage < 0
                puts "You need to go back to #{cities[game.stage]}!!"
                game.stage -=1
            else
                puts "You need to stay at Omaha Beach"
            end
        end
        if game.platoons > 0
            input = false
        begin
            puts "\nDo you want to continue playing? (Y/N)"
            option = gets.chomp.downcase
            case option
            when 'y','n'
                input = true
            else
                puts "not a valid input, try again"
            end
            end until input
        else
            puts "GAME OVER!!!"
            option = 'n'
        end
        option
    end
end
