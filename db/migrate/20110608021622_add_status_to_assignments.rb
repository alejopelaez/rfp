class AddStatusToAssignments < ActiveRecord::Migration
  def self.up
    add_column :assignments, :status, :string
  end

  def self.down
    remove_column :assignments, :status
  end
end
