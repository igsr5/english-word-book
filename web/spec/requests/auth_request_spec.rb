require 'rails_helper'

RSpec.describe "Auths", type: :request do
  let(:params) { { email: 'taro@example.com', password: 'password' } }
  let(:not_exsit_params) { { email: 'tarooooooooooooooooo@example.com', password: 'password' } }
  let(:not_auth_params) { { email: 'taro@example.com', password: 'passworrrrrrrrrrrrrrrrrrd' } }
  let(:json) { JSON.parse(response.body) }

  before do
    User.create(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')
  end
  context 'POST /api/auth' do
    context 'user exsit' do
      before do
        post '/api/auth', params: params
      end
      it 'status is 200' do
        expect(response.status).to eq 200
      end

      it 'can create token' do
        expect(json['token']).to be_present
      end
    end

    context 'user not exsit' do
      before do
        post '/api/auth', params: not_exsit_params
      end

      it 'status is 200' do
        expect(response.status).to eq 200
      end

      it 'if user is not exsit, cannot create token' do
        expect(json['status']).to eq('undefined')
        expect(json['token']).to be_blank
      end
    end

    context 'user not auth' do
      before do
        post '/api/auth', params: not_auth_params
      end

      it 'status is 200' do
        expect(response.status).to eq 200
      end

      it 'if password is wrong, cannot create token' do
        expect(json['status']).to eq('unauthoraized')
        expect(json['token']).to be_blank
      end
    end

  end
end
