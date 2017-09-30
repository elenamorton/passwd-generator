module Generator
    
    def generate_password(length, uppercase=true, lowercase=true, number=true, special=true)
        raise "Invalid 'length' argument: it must be higher than 0" if length <= 0
        raise "Invalid characters input: Please, include at least one chars type" unless uppercase || lowercase || number || special
    end

    
end