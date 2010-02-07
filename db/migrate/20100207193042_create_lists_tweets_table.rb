class CreateListsTweetsTable < ActiveRecord::Migration
  def self.up
    create_table :lists_tweets, :id => false do |t|
      t.integer :list_id
      t.integer :tweet_id
    end

    add_index :lists_tweets, [:list_id, :tweet_id]

    # For existing test database
    # Link all tweets with the lists to which user is subscribed to
    User.transaction do
      User.find(:all, :select => "users.id, lists.id, subscriptions.user_id, subscriptions.list_id", :include => :lists).each do |user|
        user.tweets.each do |tweet|
          user.lists.each do |list|
            list.tweets << tweet
          end
        end
      end
    end
  end

  def self.down
    drop_table :lists_tweets
  end
end
