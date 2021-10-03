require_relative './error_handling'
require 'colorize'
    
def new_player_name                                                 # checks if entered name of new player is valid
    puts "\nWelcome General!"
    print 'Please enter your name: '
    name = gets.chomp.downcase.strip
    validate_name(name)
rescue InvalidName => e
    puts "Invalid input!!!\n => Details: #{e.message}".red
    retry
end


def dice_number(difficulty)
    puts "\nChoose a number between "+"1 ".yellow + "and " + "#{difficulty}".yellow + " and press enter"    # checks if the number chosen for the dice game is valid
    input = gets.chomp.to_i
    validate_num(input,difficulty)
  rescue InvalidInput => e
    puts "Invalid intput!!!\n => Details: #{e.message}".red
    retry
end

def continue_playing                                            # checks if the entered value to continue is correct
    puts "\nDo you want to continue playing? (Y/N)"
    option = gets.chomp.downcase
    validate_option(option)
rescue InvalidOption =>e
    puts "Invalid option!!!\n => Details #{e.message}".red
    retry
end

