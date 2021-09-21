# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'association and validation' do
    it { should belong_to(:todo) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:proirity) }
    it { should validate_presence_of(:completed) }
  end
end
