module Api
  module Public
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: { data: users, message: 'SUCCESS'}
      end

      def show
        user = User.find(params[:id])
        render json: { data: user, message: 'SUCCESS'}
      end

      def create
        user = User.new(user_param)
        if user.save
          render json: { data: user, message: 'SUCCESS' }
        else
          render json: { message: user.errors }
        end
      end

      def update
        user = User.find(params[:id])
        if user.update(user_param)
          render json: { data: user, message: 'SUCCESS' }
        else
          render json: { message: user.errors }

        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { data: user, message: 'SUCCESS'}
      end

      private

      def user_param
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
