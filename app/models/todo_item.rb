class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  default_scope { order('updated_at DESC') }
end
