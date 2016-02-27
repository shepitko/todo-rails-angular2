class TodoList < ActiveRecord::Base
	belongs_to :user
	has_many :todo_items, :dependent => :destroy
	default_scope { order :list_due_date }
	validates  :list_name, :user_id, :list_due_date, presence: true
end
