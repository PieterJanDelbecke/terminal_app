require 'colorize'
require 'tty-font'
require 'tty-progressbar'
require 'tty-spinner'
require "./views/errors/validate_input"


module Challenge
    
    def dice_number
        puts "\nChoose a number between "+"1 ".yellow + "and " + "#{difficulty}".yellow + " and press enter"
        input = gets.chomp.to_i
        validate_name(input)
    rescue InvalidInput => e
        puts "#Invalid input: #{e.message}"
        retry
    input
    end

    
    
    def self.play(game)
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        bar = TTY::ProgressBar.new("dice is rolling... [:bar]",total: 20)
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
        turn = 0
        another_go = true
        challenge = false

        Challenge.dice_number

        while another_go == true
            puts "\npress enter to roll the dice".yellow
            roll_dice = gets.chomp
            system ('clear')
            if roll_dice.empty? || !roll_dice.empty?
                turn += 1
                dice = 1 + rand(difficulty)
                puts "Score: " + "#{game.score}".yellow
                puts "\nTurn: " + "#{turn} / 8".yellow
                if turn == 8
                    puts "LAST CHANCE!!!".red
                end
                puts "Chosen dice number: " + "#{input}".yellow
                puts
                spinner = TTY::Spinner.new("[:spinner] Dice rolling ...", format: :pulse_2)
                spinner.auto_spin # Automatic animation with default interval
                sleep(2) # Perform task
                spinner.stop("Done!") # Stop animation

                puts "\nyou have trown a: " 
                puts pastel.green(font.write("#{dice}"))
                if dice == input
                    puts "!!!SAME!!!  You won the battle!    :-)"
                    challenge = true
                else
                    puts "Ohhh...   Not the same  :-("
                    game.score -= 1
                end
                if ((turn >=8) || (challenge == true))
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
            game.score += 20
            puts "\nAWESOME!   You won the battle in: " +  "#{cities[game.stage-1]}".yellow
            puts "\nYou earned an extra platoon."
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
