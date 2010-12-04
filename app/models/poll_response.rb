class PollResponse < ActiveRecord::Base

  #Validations
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => :poll_id

  # Associations
  belongs_to :user
  belongs_to :poll
  has_many :poll_answers, :dependent => :destroy

  # Model can accept nested attributes
  accepts_nested_attributes_for :poll_answers, :allow_destroy => true
end
