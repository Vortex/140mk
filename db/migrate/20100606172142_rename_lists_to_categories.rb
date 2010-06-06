class RenameListsToCategories < ActiveRecord::Migration
  def self.up
    rename_table :lists, :categories
    rename_table :lists_tweets, :categories_tweets
    rename_column :subscriptions, :list_id, :category_id
    rename_column :categories_tweets, :list_id, :category_id
  end

  def self.down
    rename_table :categories, :lists
    rename_table :categories_tweets, :lists_tweets
    rename_column :subscriptions, :category_id, :list_id
    rename_column :lists_tweets, :category_id, :list_id    
  end
end
