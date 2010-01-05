class AddFieldsToUsersTable < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_account_created, :datetime
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :url, :string
    add_column :users, :photo, :string
    add_column :users, :description, :text
    add_column :users, :is_active, :boolean, :default => true
  end

  def self.down
    remove_column :users, :description
    remove_column :users, :photo
    remove_column :users, :url
    remove_column :users, :location
    remove_column :users, :name
    remove_column :users, :twitter_account_created
    remove_column :users, :is_active
  end
end
