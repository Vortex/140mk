class RenameListsToCategories < ActiveRecord::Migration
  def self.up
    rename_table :lists, :categories
    rename_table :lists_tweets, :categories_tweets
    rename_column :subscriptions, :category_id, :category_id
    rename_column :categories_tweets, :category_id, :category_id
  end

  def self.down
    rename_table :categories, :lists
    rename_table :categories_tweets, :lists_tweets
    rename_column :subscriptions, :category_id, :category_id
    rename_column :lists_tweets, :category_id, :tweet_id    
  end
end
