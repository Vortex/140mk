class List < ActiveRecord::Base
  CAPITALS = "АБВГДЃЕЖЗЅИЈКЛЉМНЊОПРСТЌУФХЦЧЏШ" + ('A'..'Z').to_a.join('')
  DOWNCASE = "абвгдѓежзѕијклљмнњопрстќуфхцчџш" + ('a'..'z').to_a.join('')

  has_many :subscriptions, :dependent => :destroy
  has_many :users, :through => :subscriptions

  def self.most_subscribed_lists(lists_limit)
    find :all,
      :select => 'lists.id, lists.name, COUNT(lists.id) as count',
      :joins => :subscriptions,
      :group => "subscriptions.list_id",
      :limit => lists_limit,
      :order => 'count DESC'
  end

  def to_param
    "#{id}-#{name.gsub(/[^#{CAPITALS}#{DOWNCASE} ]/, '-')}"
  end
end
