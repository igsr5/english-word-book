require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:users) { FactoryBot.create_list(:user, 10) }

  context 'GET: /api/users' do
    before do
      get '/api/users'
    end
    it 'status is 200' do
      expect(response.status).to eq(200)
    end
  end
end
