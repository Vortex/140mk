class Tweet < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
  has_and_belongs_to_many :categories

  # Validations
  validates_presence_of :user_id
  validates_presence_of :original_tweet_id
  validates_presence_of :text
end
