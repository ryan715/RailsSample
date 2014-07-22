class AddToToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :to, :string
  end
end
