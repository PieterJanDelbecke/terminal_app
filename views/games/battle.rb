class Battle

    initialize

        def play
            turn = 0
            another_go = true
            challenge = false
            puts "Choose a number between 1 and 6 and press enter to start"
            input = gets.chomp.to_i
            while another_go == true
                puts "\npress enter to roll the dice"
                roll_dice = gets.chomp
                if roll_dice == ""
                    turn += 1
                    dice = 1 + rand(6)
                    puts "you have trown a: #{dice}"
                    if dice == input
                        puts "same!! :-)"
                    challenge = true
                    else
                        puts "fucked :-("
                    end
                    if ((turn >=3) || (challenge == true))
                        another_go = false
                    else
                        puts "try again, roll the dice"
                    end
                else
                "You didn't press enter, try again.."
                end
            end
            challenge
        end
    end

end