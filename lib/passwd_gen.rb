module Generator
    UPPER_CHARS = ('A'..'Z').to_a
    LOWER_CHARS = ('a'..'z').to_a
    NUMBER = ('0'..'9').to_a
    SPECIAL = %w[! $ % & * @ ^]
    
    def generate_password(length, uppercase=true, lowercase=true, number=true, special=true)
        @password = []
        raise "Invalid 'length' argument: it must be higher than 0" if length <= 0
        raise "Invalid characters input: Please, include at least one chars type" unless uppercase || lowercase || number || special

        @password = random_generator(UPPER_CHARS) if uppercase
        @password.concat(random_generator(LOWER_CHARS)) if lowercase
        @password.concat(random_generator(NUMBER)) if number
        @password.concat(random_generator(SPECIAL)) if special
        
        return @password.shuffle.join[0...length]
    end

    private

    def random_generator(chars)
        chars.shuffle
    end

    
end