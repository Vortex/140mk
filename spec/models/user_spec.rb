require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:categories) }
    it { should have_many(:tweets) }
  end

  describe "validations" do
    it "is valid given valid attributes" do
      user = Factory.build(:user)
      user.screen_name = "twitterko"
      user.should be_valid
    end

    it "validates screen_name is present" do
      user = Factory.build(:user, :screen_name => nil)
      user.should_not be_valid
      user.errors.on(:screen_name).should_not be_nil
    end
  end

end
