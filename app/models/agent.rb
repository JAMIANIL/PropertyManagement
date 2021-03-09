class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company

  #the authenticate class method from devise documentation
  def self.authenticate(email, password)
    agent = Agent.find_for_authentication(email: email)
    agent&.valid_password?(password) ? agent : nil
  end
end
