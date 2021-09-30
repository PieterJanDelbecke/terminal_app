class InvalidInput < StandardError
end

class InvalidName < StandardError
end

class InvalidLoadName < StandardError
end

def validate_name(name)
    if name.empty?
        raise InvalidName, "Empty entries not accepted, try again"
    end
    name
end


def validate_num(num,difficulty)
    if !((1..difficulty) === num)
        raise InvalidInput, "Not in the given range, try again"
    end
    num
end

def validate_load_name(name,list_of_names)
    if !(list_of_names.include?(name))
        raise InvalidLoadName, "Not in list, try again"
    end
    name
end
