# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          token = encrypt({ user_id: user.id })
          render json: { token: token, user_id: user.id }
        else
          render json: { error: 'invalid user or password' }
        end
      end

      def registeration
        new_user = User.create(email: params[:email], password: params[:password],
                               password_confirmation: params[:password_confirmation])
        if new_user.save
          token = encrypt({ user_id: new_user.id })
          render json: { token: token, user_id: user.id }
        else
          render json: { error: new_user.errors.full_messages }
        end
      end
    end
  end
end
