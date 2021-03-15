class Lock < ApplicationRecord
  #validates :property_id, presence: true
  #validates :property_id, uniqueness: true
  validates :property_id, uniqueness: { allow_blank: true}
  belongs_to :company,optional: true
  belongs_to :property,optional: true

  def self.assign_locks(company_id)
    unassigned_locks = Lock.where(company_id: nil).limit(10)
    unassigned_locks.update_all(company_id: company_id)
  end
end
