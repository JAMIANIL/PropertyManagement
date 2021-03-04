class Company < ApplicationRecord
    has_many :agents, dependent: :destroy
    has_many :locks
    has_many :properties
    validates :name, presence: true
    validates :contact_number, presence: true,uniqueness: true
    validates :email, presence: true,uniqueness: true
    after_save :create_agent
    
    def create_agent
        Agent.create(company: self, first_name: "Master", last_name: "Agent", role:"Admin", email: "masteragent@gmail.com", password:123456)
    end
end
