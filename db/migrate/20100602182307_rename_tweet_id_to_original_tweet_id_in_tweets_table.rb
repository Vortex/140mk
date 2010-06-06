class RenameTweetIdToOriginalTweetIdInTweetsTable < ActiveRecord::Migration
  def self.up
    rename_column :tweets, :tweet_id, :original_tweet_id
  end

  def self.down
    rename_column :tweets, :original_tweet_id, :tweet_id
  end
end
