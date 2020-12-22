class Task < ApplicationRecord
  belongs_to :user
  belongs_to :todo_list

  validates :name, presence: true
  validates :completed, inclusion: { in: [ true, false ], message: "Must be marked complete or incomplete!" }
end
