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
    
    UPPERCASE = ('A'..'Z').to_a
    LOWERCASE = ('a'..'z').to_a
    NUMBER = ('0'..'9').to_a
    SPECIAL = %w[! $ % & * @ ^]
    
    def get_password(args)
        password_chars = []

        build_chars_array(password_chars, UPPERCASE, args[:uppercase])
        build_chars_array(password_chars, LOWERCASE, args[:lowercase])
        build_chars_array(password_chars, NUMBER, args[:number])
        build_chars_array(password_chars, SPECIAL, args[:special])

        password_chars_padded = string_padding(args[:length], password_chars)

        return args[:length] > password_chars.size ? random_generator(password_chars_padded) : random_generator(password_chars)[0...args[:length]]
    end
    
    def build_chars_array(destination_arr, source_arr, flag)
        destination_arr.concat(source_arr) if flag
    end
    
    def string_padding(len, str)
        (0...len).map{ |i| str[i] || str[rand(str.size)] }
    end

    def random_generator(chars)
        chars.shuffle.join
    end

    
end