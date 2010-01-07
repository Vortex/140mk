class RenameColumnIsActiveToStatusInUsersTable < ActiveRecord::Migration
  def self.up
    rename_column :users, :is_active, :status
    change_column :users, :status, :integer, :length => 1
  end

  def self.down
    rename_column :users, :status, :is_active
    change_column :users, :is_active, :boolean
  end
end
