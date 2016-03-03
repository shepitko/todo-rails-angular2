class User < ActiveRecord::Base

  has_many :todo_lists, :dependent => :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

#has_secure_password
before_validation  :set_provider 
def set_provider 
	self.provider = email if provider.blank?
end

before_validation :set_uid

def set_uid 
	self.uid = email if uid.blank?
end

#has_many :todo_lists, :dependent => :destroy
#has_many :todo_items, through: :todo_lists, source: :todo_items
#validates :email , presence: true, uniqueness: true,
#                    format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
end
