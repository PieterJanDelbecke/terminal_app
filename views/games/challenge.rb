require 'colorize'
require 'tty-font'
require 'tty-spinner'
require './views/errors/data_entry'
require_relative './dice_game'
require './views/games/layout'



module Challenge
    def self.play(game)
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        cities = ['Omaha Beach', 'Lille', 'Paris', 'Bastogne', 'Antwerp', 'Brussels', 'Cologne', 'Hannover',
        'Berlin', 'Hitlers Bunker']
        level_array = %w[Beginner Advanced Pro]
        
        header
        puts "General: " + "#{game.name.upcase}".yellow
        puts "Level: " + "#{level_array[game.level]}".yellow
        puts "\nScore: " + "#{game.score}".yellow
        puts "Platoons under your command: " + "#{game.platoons}".yellow
        puts "You are currently in: " + "#{cities[game.stage]}".green
        puts "\n#{'**'*30}"
        
        cities.each_with_index do |item,index|      # printing out the current stage
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
        input = dice_number(difficulty)             #reads the chosen number for the dice game
        result = battle(game,difficulty,input)      #play dice game

        if result                                   # won the battle (dice game)
            game.stage += 1
            game.platoons += 1
            game.score += 20
            if game.stage == 10
                puts "\n!!! WAAAAW !!!! You eliminated Hitler, Europe is liberated!!!"
                puts pastel.red(font.write("You have WON the war!!!!"))
                puts "Congralualations general " + "#{game.name.capitalize}". yellow
                game.finished = true
            else
            puts "\n!!! AWESOME !!!  You won the battle in: " +  "#{cities[game.stage-1]}".yellow
            puts "\nYou earned an extra platoon and accumuleted an extra 20 points"
            puts "Platoons: " + "#{game.platoons}".yellow
            puts "\nlet's go to:"
            puts pastel.green(font.write("#{cities[game.stage]}"))
            end


        else                                        # lost the battle (dice game)
            game.platoons -=1
            game.score -= 5
            puts "\n!!! NOOOO.. !!!  You lost the fights, you lost the battle in: " + "#{cities[game.stage]}".yellow
            puts "You lost a platoon."
            puts "Platoons: #{game.platoons}"
            if game.stage < 0
                puts "You need to go back to #{cities[game.stage]}!!"
                game.stage -=1
            else
                puts "You need to stay at Omaha Beach"
            end
        end

        if game.finished
            continue = 'n'
        elsif game.platoons > 0
            continue = continue_playing
        else 
            puts "GAME OVER!!!"
            game.stage = -1
            game.over = true
            continue = 'n'
        end
        continue 
    end
end
