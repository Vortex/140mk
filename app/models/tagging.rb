class Tagging < ActiveRecord::Base

  # Associations
  belongs_to :tag
  belongs_to :tweet

  # Validations
  validates_presence_of :tag_id
  validates_presence_of :tweet_id
  
end
