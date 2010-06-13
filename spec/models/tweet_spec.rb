require 'spec_helper'

describe Tweet do

  describe "associations" do
    it { should have_many(:tags) }
    it { should have_many(:taggings) }
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:categories) }
  end

  describe "validations" do
    it "is valid given valid attributes" do
      tweet = Factory.build(:tweet)
      tweet.should be_valid
    end

    it "validates user_id is present" do
      tweet = Factory.build(:tweet, :user_id => nil)
      tweet.should_not be_valid
      tweet.errors.on(:user_id).should_not be_nil
    end

    it "validates original_tweet_id is present" do
      tweet = Factory.build(:tweet, :original_tweet_id => nil)
      tweet.should_not be_valid
      tweet.errors.on(:original_tweet_id).should_not be_nil
    end

    it "validates text is present" do
      tweet = Factory.build(:tweet, :text => nil)
      tweet.should_not be_valid
      tweet.errors.on(:text).should_not be_nil
    end
  end

end
