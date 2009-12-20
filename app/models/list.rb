class List < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, :through => :subscriptions

  def self.most_subscribed_lists(lists_limit)
    find :all,
      :select => 'lists.name, COUNT(lists.id) as count',
      :joins => :subscriptions,
      :group => "subscriptions.list_id",
      :limit => lists_limit,
      :order => 'count ASC'
  end

  def to_param
    name
  end
end
