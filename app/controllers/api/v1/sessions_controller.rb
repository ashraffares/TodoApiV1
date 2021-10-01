module Api
  module V1
    class SessionsController < ApplicationController
      def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          token = encrypt({ user_id: user.id })
          render json: { token: token }, status: :ok
        else
          render json: { error: 'invalid user or password' }, status: :unprocessable_entity
        end
      end

      def registeration
        new_user = User.create(email: params[:email], password: params[:password],
                               password_confirmation: params[:password_confirmation])
        if new_user.save
          token = encrypt({ user_id: new_user.id })
          render json: { token: token }, status: :ok
        else
          render json: { error: new_user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
