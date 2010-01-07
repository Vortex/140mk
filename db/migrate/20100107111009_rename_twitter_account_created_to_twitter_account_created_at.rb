class RenameTwitterAccountCreatedToTwitterAccountCreatedAt < ActiveRecord::Migration
  def self.up
    rename_column :users, :twitter_account_created, :twitter_account_created_at
  end

  def self.down
    rename_column :users, :twitter_account_created_at, :twitter_account_created
  end
end
