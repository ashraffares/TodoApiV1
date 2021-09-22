class Item < ApplicationRecord
  belongs_to :todo
  validates_presence_of :name, :proirity, :completed
  validates :name, length: { minimum: 3, maximum: 25 }, message:
  { msg: 'it should be at least 3 character and maximum 25' }
end
