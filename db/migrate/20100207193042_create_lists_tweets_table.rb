class CreateListsTweetsTable < ActiveRecord::Migration
  def self.up
    create_table :lists_tweets, :id => false do |t|
      t.integer :list_id
      t.integer :tweet_id
    end

    add_index :lists_tweets, [:list_id, :tweet_id]
  end

  def self.down
    drop_table :lists_tweets
  end
end
