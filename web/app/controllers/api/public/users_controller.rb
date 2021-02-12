module Api
  module Public
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: { data: users, message: 'SUCCESS'}
      end

      def show
        User.find(params[:id])
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

