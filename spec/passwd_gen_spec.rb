require File.join(File.dirname(__FILE__), '../lib/', 'passwd_gen.rb')

RSpec.describe Generator do
    let(:generator) { Class.new { extend Generator} }
    
    context 'given an invalid set of input arguments' do
        it 'expects to raise an error if length less or equal to 0 ' do
            expect { generator.generatePassword(0) }.to raise_error "Length argument must be higher than 0"
        end
    
    end
    
end