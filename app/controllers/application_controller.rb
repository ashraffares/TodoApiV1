# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRETS = 'my$ecretK3y'

  def auth
    token = request.headers.token
    if token
      decoded_token = decrypt(token)
      user_id = decoded_token[0].user_id
      user = User.find(user_id)
      if user
        true
      else
        render json: { error: 'Wrong token!' }
      end
    else
      render json: { error: 'Missing token!' }
    end
  end

  def encrypt(payload)
    JWT.encode payload, SECRETS, 'HS256'
  end

  def decrypt(token)
    JWT.decode token, SECRETS, { algorithm: 'HS256' }
  rescue StandardError => e
    e
  end
end
