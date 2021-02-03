require 'rails_helper'

describe '[ Translate Service ]' do
  context 'can get translate' do
    before do
      @text = 'Hello, world!'
      target = 'ja'
      @translation = TranslateService.translate(@text, target)
    end

    it 'can get translate' do
      expect(@translation.origin).to eq(@text)
      expect(@translation.text).to eq('こんにちは世界！')
    end
  end
end
