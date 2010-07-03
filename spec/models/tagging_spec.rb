require File.dirname(__FILE__) + '/../spec_helper'

describe Tagging do

  describe "associations" do
    it { should belong_to(:tag) }
    it { should belong_to(:tweet) }
  end

  describe "validations" do
    before(:each) do
      @tag = Factory.create(:tag)
      @tweet = Factory.create(:tweet)
    end

    it "is valid given valid attributes" do
      tagging = @tweet.taggings.new(:tag => @tag)
      tagging.should be_valid
    end

    it "validates tag_id is present" do
      tagging = @tweet.taggings.new
      tagging.should_not be_valid
      tagging.errors.on(:tag_id).should_not be_nil
    end

    it "validates tweet_id is present" do
      tagging = @tag.taggings.new
      tagging.should_not be_valid
      tagging.errors.on(:tweet_id).should_not be_nil
    end
  end

end
