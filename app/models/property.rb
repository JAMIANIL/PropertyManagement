
class Property < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :area, presence: true
  belongs_to :company
  has_one :lock 
end
