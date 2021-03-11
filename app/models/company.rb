class Company < ApplicationRecord
    has_many :agents, dependent: :destroy
    has_many :locks
    has_many :properties
    validates :name, presence: true
    validates :contact_number, presence: true,uniqueness: true
    validates :email, presence: true,uniqueness: true
    after_create :create_agent
    after_create :create_locks

    def create_locks
        Lock.assign_locks(self.id)
    end
    
    def create_agent
        puts "I am in"
        Agent.create(company: self, first_name: "Master1", last_name: "agentt", role:"admin", email: "master#{self.name}@gmail.com", password: "1234567")
    end
end
