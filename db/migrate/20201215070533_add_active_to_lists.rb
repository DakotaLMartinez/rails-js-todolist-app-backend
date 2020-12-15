class AddActiveToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_lists, :active, :boolean
  end
end
