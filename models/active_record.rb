require 'yaml'

class ActiveRecord 

    # attr_reader :id

    def self.save(record)
        File.open('games.yml','w') do |file|
            file.write(record.to_yaml)
        end
        puts 'file is saved'
    end

    def self.load
    end    
end
