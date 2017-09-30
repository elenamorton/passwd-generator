require File.join(File.dirname(__FILE__), '../lib/', 'passwd_gen.rb')

RSpec.describe Generator do
    let(:generator) { Class.new { extend Generator} }
    
    context 'given an invalid set of input arguments' do
        it 'expects to raise an error if length less or equal to 0' do
            expect { generator.generate_password(0) }.to raise_error "Invalid 'length' argument: it must be higher than 0"
        end
        
        it 'expects to raise an error if no characters types are included' do
            expect { generator.generate_password(1, false, false, false, false) }.to raise_error "Invalid characters input: Please, include at least one chars type"
        end
    
    end
    
end