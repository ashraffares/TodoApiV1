class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: /\A(.+)@(.+)\z/, message: 'Email invalid' }, uniqueness:
  { case_sensitive: false }, length:
  { minimum: 10 }
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create, format:
  {
    with: /^[([a-z]|[A-Z])0-9_-]{6,40}$/,
    message: 'must be at least 6 characters and include one number and one letter.',
    multiline: true
  }
end
