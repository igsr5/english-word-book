require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'success create user' do
    before do
      @user = User.new(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')
    end

    it 'is valid user save' do
      expect(@user).to be_valid
    end
  end

  describe 'failed create user' do
    context 'nothing params' do
      before do
        @user = User.new()
        @user.valid?
      end

      it 'is invalid with nothing params' do
        expect(@user.errors).to be_key(:name)
        expect(@user.errors).to be_key(:email)
        expect(@user.errors).to be_key(:password)
        expect(@user.errors).to be_key(:password_confirmation)
      end
    end

    context 'not uniqu email' do
      before do
        User.create(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')
        @user = User.new(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')
        @user.valid?
      end

      it 'is invalid with duplicate email' do
        expect(@user.errors).to be_key(:email)
      end
    end
  end
end
