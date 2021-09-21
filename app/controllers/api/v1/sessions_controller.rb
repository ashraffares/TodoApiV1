# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def login
        encrypt('fares')
        render json: { msg: 'its working people' }
      end

      def registeration; end
    end
  end
end
