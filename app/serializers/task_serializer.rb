class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :notes, :completed, :todo_list_id
end
