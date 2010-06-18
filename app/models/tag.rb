class Tag < ActiveRecord::Base

  # Associations
  has_many :taggings
  has_many :tweets, :through => :taggings

  # Validations
  validates_presence_of :name

  def self.trending_tags
    Tag.find(:all, 
             :select => 'tags.id, tags.name, COUNT(*) as count', 
             :joins => :taggings, 
             :group => 'tags.name',
             :order => 'count DESC',
             :limit => G140[:trends_count])
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
