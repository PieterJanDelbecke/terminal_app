require_relative './active_record'

class Game < ActiveRecord
  attr_accessor :name, :level, :stage, :platoons, :score, :load, :over, :finished, :file_name

 FILE_NAME = "d-day.yml"

  def initialize(name: '')                  # creates an instance of the game class when initialised
    @name = name
    @level = 0
    @stage = 0
    @platoons = 3
    @score = 100
    @over = false
    @finished = false
  end

  def file_name
      name = FILE_NAME
  end
  
end

