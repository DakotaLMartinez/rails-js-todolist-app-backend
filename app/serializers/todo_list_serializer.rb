class TodoListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
