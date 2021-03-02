require 'rails_helper'

RSpec.describe "Transrates", type: :request do
  describe 'POST: api/translate' do
    before do
      @params = {
        text: 'hello',
        target: 'ja'
      }
      post '/api/translate', params: @params
    end

    it 'status is 200' do
      expect(response.status).to eq(200)
    end
  end
end
