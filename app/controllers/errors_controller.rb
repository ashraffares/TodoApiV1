class ErrorsController < ApplicationController
  def not_found
    render json: { errors: '404 Not Found Please make sure your in the right route' }
  end

  def internal_server_error
    render json:
      {  errors: '500 internal_server_error',
         contact:
         [
           { Twitter: 'https://twitter.com/Fares09301164' },
           { LinkedIn: 'https://www.linkedin.com/in/faresashraf/' },
           { Github: 'https://github.com/ashraffares' },
           { Email: 'ashraffares090@gmail.com' }
         ]
      }
  end
end
