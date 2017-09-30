module Generator
    UPPER_CHARS = ('A'..'Z').to_a
    
    def generate_password(length, uppercase=true, lowercase=true, number=true, special=true)
        @password = []
        raise "Invalid 'length' argument: it must be higher than 0" if length <= 0
        raise "Invalid characters input: Please, include at least one chars type" unless uppercase || lowercase || number || special

        @password = random_generator(UPPER_CHARS) if uppercase
        return @password.shuffle.join[0...length]
    end

    private

    def random_generator(chars)
        chars.shuffle
    end

    
end