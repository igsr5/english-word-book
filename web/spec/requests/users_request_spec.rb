require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:users) { FactoryBot.create_list(:user, 10) }

  context 'GET: /api/users' do
    before do
      users
      get '/api/users'
      @json = JSON.parse(response.body)
    end

    it 'status is 200' do
      expect(response.status).to eq(200)
    end

    it 'can get 10 users' do
      expect(@json['data'].length).to eq(10)
    end
  end

  context 'GET: api/uers/:id' do
    before do
      @user = user
      get "/api/users/#{@user.id}"
      @json = JSON.parse(response.body)
    end

    it 'status is 200' do
      expect(response.status).to eq(200)
    end

    it 'can get the user' do
      expect(@json['data']['id']).to eq(@user.id)
    end
  end

  context 'POST: /api/users' do
    before do
      @params = {
        user: {
          name: '山田太郎',
          email: 'taro@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }

      post '/api/users', params: @params
      @json = JSON.parse(response.body)
    end

    it 'status is 200' do
      expect(response.status).to eq(200)
    end

    it 'can create the user' do
      expect(@json['data']['email']).to eq(@params[:user][:email])
    end
  end
end
