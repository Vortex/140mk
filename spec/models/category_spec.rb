require File.dirname(__FILE__) + '/../spec_helper'

describe Category do

  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:users) }
    it { should have_and_belong_to_many(:tweets) }
  end

  describe "validations" do
    it "is valid given valid attributes" do
      category = Factory.build(:category)
      category.should be_valid
    end

    it "validates name is present" do
      category = Factory.build(:category, :name => nil)
      category.should_not be_valid
      category.errors.on(:name).should_not be_nil
    end
  end

end
