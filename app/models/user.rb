class User < ActiveRecord::Base

has_secure_password

has_many :todo_lists, :dependent => :destroy
has_many :todo_items, through: :todo_lists, source: :todo_items
validates :email , presence: true, uniqueness: true,
                    format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
end
