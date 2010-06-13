require 'spec_helper'

describe Subscription do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  describe "validations" do
    before(:each) do
      @user = Factory.create(:user)
      @category = Factory.create(:category)
    end

    it "is valid given valid attributes" do
      subscription = @user.subscriptions.new(:category => @category)
      subscription.should be_valid
    end

    it "validates user_id is present" do
      subscription = @category.subscriptions.new
      subscription.should_not be_valid
      subscription.errors.on(:user_id).should_not be_nil
    end

    it "validates category_id is present" do
      subscription = @user.subscriptions.new
      subscription.should_not be_valid
      subscription.errors.on(:category_id).should_not be_nil
    end

    it "validates user can create max 6 subscription" do
      @user.subscriptions.create!(:category => Factory.create(:category, :name => "C1"))
      @user.subscriptions.create!(:category => Factory.create(:category, :name => "C2"))
      @user.subscriptions.create!(:category => Factory.create(:category, :name => "C3"))
      @user.subscriptions.create!(:category => Factory.create(:category, :name => "C4"))
      @user.subscriptions.create!(:category => Factory.create(:category, :name => "C5"))
      @user.subscriptions.create!(:category => Factory.create(:category, :name => "C6"))
      subscription = @user.subscriptions.create(:category => Factory.create(:category, :name => "C7"))
      @user.subscriptions.count.should == 6
      subscription.errors.on(:base).should_not be_nil
    end

    it "validates uniqueness of user in category scope" do
      @user.subscriptions.create!(:category => @category) # create subscription
      subscription = @user.subscriptions.new(:category => @category)
      subscription.should_not be_valid
    end
  end

end
