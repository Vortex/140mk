require 'spec_helper'

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

end
