class Property < ApplicationRecord
  belongs_to :company
  has_one :lock
end
