class Category < ActiveRecord::Base

  # Associations
  has_many :subscriptions, :dependent => :destroy
  has_many :users, :through => :subscriptions
  has_and_belongs_to_many :tweets

  # Validations
  validates_presence_of :name

  # Named scopes
  named_scope :ordered_by_subscriptions, :joins => :subscriptions, :group => 'categories.id', :order => 'count(subscriptions.id) desc'

  def self.most_subscribed_categories(categories_limit)
    find :all,
      :select => 'categories.id, categories.name, COUNT(categories.id) as count',
      :joins => :subscriptions,
      :group => "subscriptions.category_id",
      :limit => categories_limit,
      :order => 'count DESC'
  end

  def to_param
    "#{id}-#{name.gsub(' ', '-').gsub('/', '-').to_lat.downcase}"    
  end
end
