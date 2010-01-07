class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.references :user
      t.integer :tweet_id
      t.string :text
      t.datetime :created_at
    end
    execute("ALTER TABLE `tweets` MODIFY COLUMN `tweet_id` BIGINT NOT NULL;")
    add_index :tweets, :user_id
    add_index :tweets, :tweet_id
  end

  def self.down
    drop_table :tweets
  end
end
