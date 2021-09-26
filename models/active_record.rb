require 'yaml'

class ActiveRecord 

    attr_reader :id

    def self.db
        @db ||= (YAML.load(File.read('games.yml')) rescue [])
    end

    def self.save(record)
        self.db << record
        File.open('games.yml','w') do |file|
            file.write(self.db.to_yaml)
        end
        puts "******** DB saved ********"
        puts self.db
        puts "**************************"
    end

    def self.load(name)
        record = self.db.detect {|r| r.name == name}
        record
    end

end
