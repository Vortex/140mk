Factory.define :tweet do |tweet|
  tweet.association :user
  tweet.text "Sample tweet text"
  tweet.original_tweet_id "11111111"
end
