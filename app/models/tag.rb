class Tag < ActiveRecord::Base

  # Associations
  has_many :taggings
  has_many :tweets, :through => :taggings

  # Validations
  validates_presence_of :name
end
