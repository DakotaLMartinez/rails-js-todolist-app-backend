class TodoList < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, presence: true

  def make_active_list_for(user)
    user.todo_lists.update_all(active: false)
    self.update(active: true)
  end
end
