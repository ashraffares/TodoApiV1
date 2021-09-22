class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_presence_of :title, :created_by
  validates :title, length: { minimum: 3, maximum: 25, message: 'it should be at least 3 character and maximum 25'}
end
