require_relative './active_record'

class Game < ActiveRecord
  attr_accessor :name, :level, :stage, :platoons, :score

  def initialize(name: '')
    @name = name
    @level = 0
    @stage = 0
    @platoons = 3
    @score = 0
  end
end
