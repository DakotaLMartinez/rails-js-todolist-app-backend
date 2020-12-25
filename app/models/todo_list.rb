class TodoList < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroygi

  validates :name, presence: true
end
