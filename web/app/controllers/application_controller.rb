class ApplicationController < ActionController::API
  before_action :set_session
  before_action :require_login
  include ActionController::HttpAuthentication::Token::ControllerMethods

  @@session = {}

  def require_login
    render json: { error: 'unauthorized token' , status: 'unauthorized token' } if @@session.blank?
  end

  private

  def set_session
    authenticate_with_http_token do |token, options|
      @@session = Session.get(token)
    end
  end
end
