

class Game
    attr_reader  :name
    attr_accessor :level, :stage, :platoons, :score

    def initialize (name: '')
        @name = name
        @level = 0
        @stage = 0
        @platoons = 3
        @score = 0
    end

    def name=(name)
        @name = name
    end
end
