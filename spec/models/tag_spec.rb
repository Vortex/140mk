require File.dirname(__FILE__) + '/../spec_helper'

describe Tag do

  describe "associations" do
    it { should have_many(:taggings) }
    it { should have_many(:tweets) }
  end

  describe "validations" do
    it "is valid given valid attributes" do
      tag = Factory.build(:tag)
      tag.should be_valid
    end

    it "validates name is present" do
      tag = Factory.build(:tag, :name => nil)
      tag.should_not be_valid
      tag.errors.on(:name).should_not be_nil
    end
  end

  describe "chronological filters" do

    it "shouldn't return trending topic" do
      result = Tag.trending_from(1.day.ago)

      result.size.should == 0
    end

    it "should return one trending topic for last 24 hours" do
      tweet = Factory.create(:tweet, :text => "Test tweet 1", :created_at => 6.hours.ago)
      tag = Factory.create(:tag, :name => 'test')
      Factory.create(:tagging, :tweet => tweet, :tag => tag)

      result = Tag.trending_from(1.day.ago)

      result.size.should == 1
    end

    it "should return two trending topics for last 24 hours" do
      tweet1 = Factory.create(:tweet, :text => "Test tweet 1", :created_at => 6.hours.ago)
      tweet2 = Factory.create(:tweet, :text => "Test tweet 2", :created_at => 12.hours.ago)
      tweet3 = Factory.create(:tweet, :text => "Test tweet 3", :created_at => 2.days.ago)
      tweet4 = Factory.create(:tweet, :text => "Test tweet 4", :created_at => 1.month.ago)
      tag1 = Factory.create(:tag, :name => 'test1', :created_at => 6.hours.ago)
      tag2 = Factory.create(:tag, :name => 'test2', :created_at => 12.hours.ago)
      tag3 = Factory.create(:tag, :name => 'test3', :created_at => 2.days.ago)
      tag4 = Factory.create(:tag, :name => 'test4', :created_at => 1.month.ago)
      Factory.create(:tagging, :tweet => tweet1, :tag => tag1, :created_at => tweet1.created_at)
      Factory.create(:tagging, :tweet => tweet2, :tag => tag2, :created_at => tweet2.created_at)
      Factory.create(:tagging, :tweet => tweet3, :tag => tag3, :created_at => tweet3.created_at)
      Factory.create(:tagging, :tweet => tweet4, :tag => tag4, :created_at => tweet4.created_at)

      result = Tag.trending_from(1.day.ago)

      result.size.should == 2
    end

  end

end
