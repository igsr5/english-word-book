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
end
