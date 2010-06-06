require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

  # Associations
  it { should have_many(:subscriptions) }
  it { should have_many(:categories) }
  it { should have_many(:tweets) }

end