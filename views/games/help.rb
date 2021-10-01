require './views/games/layout'
require 'tty-prompt'

module Views
    module Games
        def self.help                           # help page
        header
        puts "#{"*"*15}  SETTING  #{"*"*15}".yellow.italic
        puts "\nThe D-DAY game is situated in May 1944, when Europe was occupied by Nazi Germany "
        puts "You are an American general in charge of the liberation of occupied Europe"
        puts "You need to conquer city by city back from the Germans, until you make it to Berlin"
        puts "Once in Berlin you need to eliminate Hitler"
        puts "The route to Berlin starts on D-DAY with the landing on Omaha beach in Normandy, France"
        puts "You need to fight your way from Omaha Beach in Normany, through France, Belgium and Germany towards Berlin"
        puts "\nOmaha Beach => Lille => Paris => Bastogne => Antwerp => Brussels => Cologne => Hannover => Berlin => Hitlers bunker".green
        
        puts "\n\n#{"*"*15}  GAME PLAY  #{"*"*15}".yellow.italic
        puts "\nD-DAY is a dice game where you have to battle with the Germans to conquer back each city"
        puts "The battles are played out with a dice game"
        puts "First you need to pick a number in a given range and afer that you have to throw the dice"
        puts "Ranges: "
        puts "     Beginner    : 1 - 4"
        puts "     Advanced    : 1 - 5"
        puts "     Pro         : 1 - 6"
        puts "When you throw the same number as the number you have picked, you win the battle"
        puts "You get 8 turns to throw your picked number, if you fail to get the same number you lose the battle"
        puts "You win the game when you make it to Hitlers bunker and win the dice game"
        puts "It's game over when you lost all your platoons"
        
        puts "\n\n#{"*"*15}  SCORE SYSTEM  #{"*"*15}".yellow.italic
        puts "\nEvery general starts with 100 points and 3 platoons"
        puts "When you win a battle you gain 20 poins and get an extra platoon"
        puts "When you lose a battle you lose 5 points and lose a platoon too"
        puts "For each dice game that you play you lose a point"
        end
    end
end
