# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRETS = 'my$ecretK3y'

  def auth; end

  def encrypt(payload)
    JWT.encode payload, SECRETS, 'HS256'
  end

  def decrypt(token)
    JWT.decode token, SECRETS, { algorithm: 'HS256' }
  rescue StandardError => e
    e
  end
end
