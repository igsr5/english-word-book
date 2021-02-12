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

      end

      def update

      end

      def destroy

      end
    end
  end
end

