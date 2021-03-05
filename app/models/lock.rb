class Lock < ApplicationRecord
  #validates :number, presence: true
  #validates :number, uniqueness: true
  belongs_to :company,optional: true
  belongs_to :property,optional: true

  def self.get_locks(company_id)
    locks = Lock.all
    n=0
    locks.each do |lock|
      if lock.company.blank?
        lock.update_attribute(:company_id, company_id)
        n+=1
      end
      if n>9
        break
      end
    end
  end
end
