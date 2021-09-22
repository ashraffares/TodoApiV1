require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'association and validation' do
    it { should belong_to(:todo) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:proirity) }
    it { should validate_presence_of(:completed) }
    it { should validate_length_of(:name)
    .is_at_least(3).with_message('it should be at least 3 character and maximum 25') }
  end
end
