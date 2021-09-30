    require_relative './error_handling'
    
    
    def dice_number(difficulty)
        puts "\nChoose a number between "+"1 ".yellow + "and " + "#{difficulty}".yellow + " and press enter"
        input = gets.chomp.to_i
        validate_num(input,difficulty)
    rescue InvalidInput => e
        puts "Invalid intput, details: #{e.message}"
        retry
    end

