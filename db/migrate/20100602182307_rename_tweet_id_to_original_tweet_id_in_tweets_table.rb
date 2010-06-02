class RenameTweetIdToOriginalTweetIdInTweetsTable < ActiveRecord::Migration
  def self.up
    rename_column :tweets, :tweet_id, :original_tweet_id
  end

  def self.down
  end
end
