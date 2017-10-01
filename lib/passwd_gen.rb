module Generator
    MAX_LENGTH = 255
    
    def generate_password(length, uppercase=true, lowercase=true, number=true, special=true)
        raise "Invalid 'length' argument: it must be higher than 0" if length <= 0
        raise "Invalid characters input: Please, include at least one chars type" unless uppercase || lowercase || number || special
        
        input = Hash.new()
        input[:length] = length
        input[:uppercase] = uppercase
        input[:lowercase] = lowercase
        input[:number] = number
        input[:special] = special
        get_password(input)
    end

    private
    
    UPPER_CHARS = ('A'..'Z').to_a
    LOWER_CHARS = ('a'..'z').to_a
    NUMBER = ('0'..'9').to_a
    SPECIAL = %w[! $ % & * @ ^]
    
    def get_password(args)
        @password = []
        @password = random_generator(UPPER_CHARS) if args[:uppercase]
        @password.concat(random_generator(LOWER_CHARS)) if args[:lowercase]
        @password.concat(random_generator(NUMBER)) if args[:number]
        @password.concat(random_generator(SPECIAL)) if args[:special]
        return @password.shuffle.join[0...args[:length]]
    end

    def random_generator(chars)
        chars.shuffle
    end

    
end