class AddNameDescriptionFromToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :description, :text
    add_column :tasks, :from, :string
  end
end
