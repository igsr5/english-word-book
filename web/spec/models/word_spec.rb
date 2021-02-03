require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:user) { User.create(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password') }

  describe 'success create word' do
    before do
      @word = Word.new(origin: 'Hello', text: 'こんにちは', user_id: user.id)
    end
    it 'is valid word save' do
      expect(@word).to be_valid
    end
  end

  describe 'failed create word' do
    context 'nothing params' do
      before do
        @word = Word.new
        @word.valid?
      end

      it 'is invalid by presence: true' do
        expect(@word.errors).to be_key(:origin)
        expect(@word.errors).to be_key(:text)
        expect(@word.errors).to be_key(:user)
      end
    end

    context 'not found user' do
      before do
        @word = Word.new(origin: 'Hello', text: 'こんにちは', user_id: 99999)
        @word.valid?
      end

      it 'is invalid by belongs_to :user' do
        expect(@word.errors).to be_key(:user)
      end
    end
  end
end
