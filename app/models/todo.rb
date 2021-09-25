# frozen_string_literal: true

class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_presence_of :title, :created_by
  validates_length_of :title, minimum: 3, maximum: 25, message: 'it should be at least 3 character and maximum 25'
  belongs_to :user
end
