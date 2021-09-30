require 'colorize'
require 'tty-font'


def header
    system 'clear'
    font = TTY::Font.new(:doom)
    pastel = Pastel.new
    puts pastel.red(font.write("D-DAY"))
end


