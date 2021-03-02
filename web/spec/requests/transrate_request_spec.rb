require 'rails_helper'

RSpec.describe "Transrates", type: :request do
  let(:json) { JSON.parse(response.body) }
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

    it 'can translate the word' do
      expect(json['text']).to eq('こんにちは')
      expect(json['origin']).to eq('hello')
    end
  end
end
