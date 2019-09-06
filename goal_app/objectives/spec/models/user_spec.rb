require 'rails_helper'

RSpec.describe User, type: :model do
    # validations
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    describe 'uniqueness' do
        
      before :each do
        create(:user) 
      end

      it { should validate_uniqueness_of(:username) } 
      it { should validate_uniqueness_of(:session_token) } 
    end

    # associations

    # public methods
    describe 'is_password?' do
      let!(:user) { create(:user) } 
    
      context 'with an invalid password' do
        it 'should return false' do
          expect(user.is_password?('badpassword')).to be false
        end
      end

      context 'with a valid password' do
        it 'should return true' do
                expect(user.is_password?('password')).to be true
            end
        end
    end
end 