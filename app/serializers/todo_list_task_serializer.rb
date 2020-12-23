class TodoListTaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :active
  has_many :tasks
end
