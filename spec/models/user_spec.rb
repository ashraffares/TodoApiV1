require 'rails_helper'

RSpec.describe User, type: :model do
  context 'association and validation' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
