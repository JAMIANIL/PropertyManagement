class Company < ApplicationRecord
    has_many :agents
    has_many :locks
    has_many :properties
end
