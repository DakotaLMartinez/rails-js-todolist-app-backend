class TodoListTaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name 
  has_many :tasks
end
