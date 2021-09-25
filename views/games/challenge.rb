require_relative './battle'

module Challenge
  # def battle
  #     turn = 0
  #     another_go = true
  #     challenge = false
  #     puts "Choose a number between 1 and 6 and press enter to start"
  #     input = gets.chomp.to_i
  #     while another_go == true
  #         puts "press enter to roll the dice"
  #         roll_dice = gets.chomp
  #         if roll_dice == ""
  #             turn += 1
  #             dice = 1 + rand(6)
  #             puts "you have trown a: #{dice}"
  #             if dice == input
  #                 puts "same!! :-)"
  #             challenge = true
  #             else
  #                 puts "fucked :-("
  #             end
  #             if ((turn >=3) || (challenge == true))
  #                 another_go = false
  #             else
  #                 puts "try again, roll the dice"
  #             end
  #         else
  #         "You didn't press enter, try again.."
  #         end
  #     end
  #     challenge
  # end

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
    Views::Battle.play
    puts battle
    if battle
      puts 'you won the battle!'
      game.platoons += 1
      game.stage += 1
    else
      puts 'you lost the Battle'
      game.platoons -= 1
    end
  end
end
