require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'association and validation' do
    it { should belong_to(:todo) }
  end
end
