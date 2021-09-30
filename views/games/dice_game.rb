require 'colorize'
require 'tty-font'
require 'tty-spinner'
require './views/games/layout'


def battle(game,difficulty,input)
    font = TTY::Font.new(:doom)
    pastel = Pastel.new
    turn = 0
    another_go = true
    challenge = false

    while another_go == true
        puts "\npress enter to roll the dice".yellow
        roll_dice = gets.chomp
        # system ('clear')
        if roll_dice.empty? || !roll_dice.empty?
            header
            turn += 1
            dice = 1 + rand(difficulty)
            puts "Score: " + "#{game.score}".yellow
            puts "Turn : " + "#{turn}/8".yellow
                if turn == 8
                puts "LAST CHANCE!!!".red
                end

            puts "\nChosen dice number: " + "#{input}".yellow
            puts
            spinner = TTY::Spinner.new("[:spinner] Dice rolling ...", format: :pulse_2)
            spinner.auto_spin # Automatic animation with default interval
            sleep(2) # Perform task
            spinner.stop("Done!") # Stop animation

            puts "\nYou have trown a: " 
            puts pastel.green(font.write("#{dice}"))
            if dice == input
                puts "!!! SAME !!!  You won the battle!    :-)"
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
    challenge
end