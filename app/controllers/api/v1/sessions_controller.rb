module Api
  module V1
    class SessionsController < ApplicationController
      def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          token = encrypt({ user_id: user.id })
          render json: { token: token }
        else
          render json: { error: 'invalid user or password' }
        end
      end

      def registeration
        new_user = User.create(email: params[:email], password: params[:password],
                               password_confirmation: params[:password_confirmation])
        if new_user.save
          token = encrypt({ user_id: new_user.id })
          render json: { token: token }
        else
          render json: { error: 'you did something stupid you should not use the app again!' }
        end
      end
    end
  end
end
