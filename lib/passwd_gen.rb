module Generator
    MAX_LENGTH = 255
    
    def generate_password(length, uppercase=true, lowercase=true, number=true, special=true)
        raise "Invalid 'length' argument: it must be higher than 0" if length <= 0
        raise "Invalid 'length' argument: it must be lower than #{MAX_LENGTH}" if length > MAX_LENGTH
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
        password_chars = []

        password_chars.concat(UPPER_CHARS) if args[:uppercase]
        password_chars.concat(LOWER_CHARS) if args[:lowercase]
        password_chars.concat(NUMBER) if args[:number]
        password_chars.concat(SPECIAL) if args[:special]

        temp = (0...args[:length]).map{ |i| password_chars[i] || password_chars[rand(password_chars.size)] }

        return args[:length] > password_chars.size ? random_generator(temp) : random_generator(password_chars)[0...args[:length]]
    end

    def random_generator(chars)
        chars.shuffle.join
    end

    
end