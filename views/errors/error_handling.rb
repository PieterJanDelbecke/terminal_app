class InvalidInput < StandardError
end

def validate_num(num,difficulty)
    if num > difficulty
        raise InvalidInput, "TOO BIG"
    end
    if num < 1
        raise InvalidInput, "TOO SMALL"
    end
    num
end