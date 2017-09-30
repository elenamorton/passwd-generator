require File.join(File.dirname(__FILE__), '../lib/', 'passwd_gen.rb')

RSpec.describe Generator do
    let(:generator) { Class.new { extend Generator} }
    let(:uppercase) { true }
    let(:lowercase) { true }
    let(:number) { true }
    let(:special) { true }
    let(:no_uppercase) { false }
    let(:no_lowercase) { false }
    let(:no_number) { false }
    let(:no_special) { false }
    
    context 'given an invalid set of input arguments' do
        it 'expects to raise an error if length less or equal to 0' do
            expect { generator.generate_password(0) }.to raise_error "Invalid 'length' argument: it must be higher than 0"
        end
        
        it 'expects to raise an error if no characters types are included' do
            expect { generator.generate_password(1, no_uppercase, no_lowercase, no_number, no_special) }.to raise_error "Invalid characters input: Please, include at least one chars type"
        end
    
    end
    
    context 'given a valid set of input' do
        it 'expects to include uppercase letters' do
            expect(generator.generate_password(10, uppercase, no_lowercase, no_number, no_special)).to match( a_string_matching(/[A-Z]{10}/) )
            expect(generator.generate_password(10, uppercase, no_lowercase, no_number, no_special)).not_to match( a_string_matching(/[a-z]{10}/) )
            expect(generator.generate_password(10, uppercase, no_lowercase, no_number, no_special)).not_to match( a_string_matching(/[0-9]{10}/) )
        end
        
        
    end
    
end