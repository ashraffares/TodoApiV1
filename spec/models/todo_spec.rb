require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'todo association and validation' do
    it { should have_many(:items) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:created_by) }
  end
end
