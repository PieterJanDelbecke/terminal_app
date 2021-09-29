require 'yaml'

class ActiveRecord 
    class RecordNotFound <StandardError; end
    
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
    end

    def self.save_loaded(record)
        File.open('games.yml','w') do |file|
        file.write(self.db.to_yaml)
        end
    end

    def self.load(name)
        record = self.db.detect {|r| r.name == name}
        # record
    end

    def self.check_name(name)
        record = self.db.detect {|r| r.name == name}
        raise RecordNotFound.new(name) unless record
        record

    end

end
