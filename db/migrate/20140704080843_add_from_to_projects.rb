class AddFromToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :from, :string
    add_column :projects, :string, :string
  end
end
