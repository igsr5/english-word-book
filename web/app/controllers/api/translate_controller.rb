module Api
  class TranslateController < ApplicationController
    skip_before_action :require_login, only: [:create]
    def create
      status = 'failed'
      translate = TranslateService.translate(params[:text], params[:target])
      status = 'success' if translate.text.present? && translate.origin.present?
      render json: { status: status, text: translate.text, origin: translate.origin, to: translate.to, from: translate.from }
    end
  end
end
