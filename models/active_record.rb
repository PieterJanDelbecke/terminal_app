require 'yaml'

class ActiveRecord 

    attr_reader :name

    def self.db
        @db ||= (YAML.load(File.read('games.yml')) rescue [])
    end

    def self.all
        self.db
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

    # def self.destroy(record)
    #     idx = db.index{|obj| obj.name == record}
    #     db[idx] = {record.name = "Steff", record.level = 5, record.stage = 5, record.platoon = 7 , record.score = 99}
    #     File.open('games.yml','w') do |file|
    #         file.write(self.db.to_yaml)
    #     end
    # end

end
