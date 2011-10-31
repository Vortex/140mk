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

  describe "following check" do

    it "should return false if user is not followed" do
      user1 = Factory.create(:user, :screen_name => "VortexDNR")
      user2 = Factory.create(:user, :screen_name => "unknown_user")

      result = user1.follows_user? user2

      assert_equal result, false
    end

    it "should return true if user is followed" do
      user1 = Factory.create(:user, :screen_name => "VortexDNR")
      user2 = Factory.create(:user, :screen_name => "140mk")

      result = user1.follows_user? user2

      assert_equal result, true
    end

  end

end
