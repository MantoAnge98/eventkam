require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model features', type: :model do
    context 'If the user email is empty' do
      it 'gets caught in the validation' do
        user = User.new(email: '', password: 'failure test')
        expect(user).not_to be_valid
      end
    end
  
    context 'if the user password are empty' do
      it 'gets caught in the validation' do
        # Here's what you need to know
        user = User.new(email: 'task@gmail.com', password: '')
        expect(user).not_to be_valid
      end
    end

    context 'if the name and password of the user are described' do
      it 'validation passes' do
        # Here's what you need to know
        user = User.new( name: 'user', email: 'user@gmail.com', password: 'password', admin: 1)
        expect(user).to be_valid
      end
    end
  end
end
