class Lock < ApplicationRecord
  validates :number, presence: true
  validates :number, uniqueness:true
  belongs_to :company
  belongs_to :property
end
