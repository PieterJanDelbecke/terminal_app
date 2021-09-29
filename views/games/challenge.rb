require 'colorize'
require 'tty-font'


module Challenge
    

    def self.play(game)
        font = TTY::Font.new(:doom)
        cities = ['Omaha Beach', 'Lille', 'Paris', 'Bastogne', 'Antwerp', 'Brussels', 'Cologne', 'Hannover',
        'Berlin', 'Buncker']
        level_array = %w[Beginner Advanced Pro]
        system('clear')
        
        puts "Hello General: " + "#{game.name.upcase}".yellow
        puts "Level: " + "#{level_array[game.level]}".yellow
        puts "Platoons under your command: " + "#{game.platoons}".yellow
        puts "You are currently in: " + "#{cities[game.stage]}".yellow
        puts '**'*30
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
        difficulty = 4 + game.level
        turn = 0
        another_go = true
        challenge = false
        puts "\nChoose a number between 1 and #{difficulty} and press enter to start"
        input = gets.chomp.to_i
        while another_go == true
            puts "\npress enter to roll the dice".yellow
            roll_dice = gets.chomp
            if roll_dice.empty? || !roll_dice.empty?
                turn += 1
                dice = 1 + rand(difficulty)
                puts "you have chosen number: " + "#{input}".yellow
                puts "you have trown a: " 
                puts font.write("#{dice}")
                if dice == input
                    puts "!!SAME!! You won the battle!! :-)"
                    challenge = true
                else
                    puts "Ohhh...Not the same :-("
                end
                if ((turn >=10) || (challenge == true))
                    another_go = false
                else
                    puts "\ntry again, roll the dice.."
                end
            else
                "You didn't press enter, try again.."
            end
        end
        if challenge        # won the battle
            game.stage += 1
            game.platoons += 1
            puts "\nAWESOME!!! you won the battle in: " +  "#{cities[game.stage-1]}".yellow
            puts "Congrats, you did well. You earned an extra platoon."
            puts "Platoons: " + "#{game.platoons}".yellow
            puts "let's go to:"
            puts font.write("#{cities[game.stage]}")
        else               # lost the battle
            game.platoons -=1
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
