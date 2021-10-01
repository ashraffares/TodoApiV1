# frozen_string_literal: true

# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'association and validation' do
    it { should have_many(:items).dependent(:destroy) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:created_by) }
    it { should validate_length_of(:title).is_at_least(3).is_at_most(25).with_message('it should be at least 3 character and maximum 25') }
  end
end

# rubocop:enable Layout/LineLength
