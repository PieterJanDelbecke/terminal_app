require 'colorize'

module Challenge

    def self.play(game)
        cities = ['Omaha Beach', 'Lille', 'Paris', 'Bastogne', 'Antwerp', 'Brussels', 'Cologne', 'Hannover',
        'Berlin', 'Buncker']
        level_array = %w[beginner medium pro]
        system('clear')
        puts "Hello General: #{game.name}"
        puts "You are a #{level_array[game.level]}"
        puts "You have #{game.platoons} platoons under your command"
        puts "You are currently in #{cities[game.stage]}"
        puts '********************************'

        cities.each_with_index do |item,index|
                if game.stage == index
                    print "#{item} => ".green
                    print index
                elsif game.stage > index
                    print "#{item} => ".blue
                    print index
                else
                    print "#{item} => ".red
                    print index
                end
                puts
        end

        turn = 0
        another_go = true
        challenge = false
        puts "\nChoose a number between 1 and 4 and press enter to start"
        input = gets.chomp.to_i
        while another_go == true
            puts "\npress enter to roll the dice".yellow
            roll_dice = gets.chomp
            if roll_dice == ""
                turn += 1
                dice = 1 + rand(4)
                puts "you have trown a: #{dice}"
                if dice == input
                    puts "same!! You won the battle!! :-)"
                    challenge = true
                else
                    puts "Lost... :-("
                end
                if ((turn >=6) || (challenge == true))
                    another_go = false
                else
                    puts "try again, roll the dice"
                end
            else
                "You didn't press enter, try again.."
            end
        end
        if challenge        # won the battle
            game.stage += 1
            game.platoons += 1
            puts "\nAwesome you won the battle in: #{cities[game.stage-1]}!"
            puts "Congrats, you did well. You earned an extra platoon."
            puts "Platoons: #{game.platoons}"
            puts "Let's go to #{cities[game.stage]}!!"
        else
            game.platoons -=1
            puts "\nNoooo you lost the 3 fights, you lost the battle in: #{cities[game.stage]}!"
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
            puts "\nDo you want to continue playing? (Y/N)"
            option = gets.chomp
        else
            puts "GAME OVER!!!"
            option = 'N'
        end
        option
    end
end
