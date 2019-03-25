require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.authenticate_with_credentials' do
    @user = User.find_by(email: 'lucyluu123@gmail.com')
    @user = User.create!(
      first_name: 'Lucy',
      last_name:'Luu',
      email: 'lucyluu123@gmail.com',
      password: '12345678') unless @user

    it 'returns user with correct credentials' do
      logged_in = User.authenticate_with_credentials('lucyluu123@gmail.com', '12345678')
      expect(logged_in).not_to eq(nil)
      expect(logged_in.first_name).to eq('Lucy')
    end

    it 'returns nil with incorrect email' do
      logged_in = User.authenticate_with_credentials('nonexistent@gmail.com', '12345678')
      expect(logged_in).to eq(nil)
    end

    it 'returns nil with incorrect password' do
      logged_in = User.authenticate_with_credentials('lucyluu123@gmail.com', 'wrongPassword')
      expect(logged_in).to eq(nil)
    end 
  end
  
  describe 'Validations' do
    it 'validates presence of password' do
      user = User.new
      user.password = nil
      user.password_confirmation = 'meh'
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
      expect(user.password_confirmation).not_to eq(user.password)

      user = User.new
      user.password = 'something'
      user.password_confirmation = 'something'
      user.valid?
      expect(user.errors[:password]).not_to include("can't be blank")
      expect(user.password_confirmation).to eq(user.password)
      expect(user.password.length).to be >=(8)

    end 

    it 'validates presence of email' do
      user = User.new
      user.email = nil
      user.save
      expect(user.errors[:email]).to include("can't be blank")

      user = User.new email: 'something@gmail.com'
      user.save
      expect(user.errors[:email]).not_to include("can't be blank")
    end 

    it 'validates presence of first_name' do
      user = User.new
      user.first_name = nil
      user.save
      expect(user.errors[:first_name]).to include("can't be blank")

      user = User.new
      user.first_name = 'Jenny'
      user.save
      expect(user.errors[:first_name]).not_to include("can't be blank")
    end

    it 'validates presence of last_name' do
      user = User.new
      user.last_name = nil
      user.save
      expect(user.errors[:last_name]).to include("can't be blank")

      user = User.new
      user.last_name = 'Li'
      user.save
      expect(user.errors[:last_name]).not_to include("can't be blank")
    end
  end
end
