class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    token = ''
    status = 'unauthoraized'
    if user && user.authenticate(params[:password])
      token = Session.create(user)
      status = 'created'
    end
    render json: { token: token, status: status }
  end
end
