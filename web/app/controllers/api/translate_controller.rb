module Api
  class TranslateController < ApplicationController
    skip_before_action :require_login, only: [:create]
    def create
      test = 'Hello, world!'
      target = 'ja'
      translate = TranslateService.translate(test, target)
      render json: { text: translate.text, origin: translate.origin, to: translate.to, from: translate.from }
    end
  end
end
