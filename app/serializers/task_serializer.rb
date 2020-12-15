class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :notes, :completed
end
