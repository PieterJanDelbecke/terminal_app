require 'colorize'
require 'tty-font'


def header                      # Displays the D-Day logo on top of the screen
    system 'clear'
    font = TTY::Font.new(:doom)
    pastel = Pastel.new
    puts pastel.red(font.write("D-DAY"))
end


