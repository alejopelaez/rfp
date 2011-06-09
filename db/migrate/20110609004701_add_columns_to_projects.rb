class AddColumnsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :comment, :string
    add_column :projects, :company, :string
  end

  def self.down
    remove_column :projects, :company
    remove_column :projects, :comment
  end
end
