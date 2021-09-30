require_relative './error_handling'
require 'colorize'
    
def new_player_name
    puts "\nWelcome General!"
    print 'Please enter your name: '
    name = gets.chomp.downcase.strip
    validate_name(name)
rescue InvalidName => e
    puts "Invalid input!!!\n => Details: #{e.message}".red
    retry
end


def dice_number(difficulty)
    puts "\nChoose a number between "+"1 ".yellow + "and " + "#{difficulty}".yellow + " and press enter"
    input = gets.chomp.to_i
    validate_num(input,difficulty)
  rescue InvalidInput => e
    puts "Invalid intput!!!\n => Details: #{e.message}".red
    retry
end

# def load_player(list_of_names)
#     puts "Welcome back general, we were waiting for you!"
#     puts "What is your name? "
#     name = gets.chomp.downcase.strip
#     validate_load_name(name,list_of_names)
# rescue InvalidLoadName => e
#   puts "Invalid name: error details: #{e.message}".red
#   retry
# end

