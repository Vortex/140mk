class Poll < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description

  # Associations
  has_many :poll_questions, :dependent => :destroy
  has_many :poll_responses, :dependent => :destroy

  # Model can accept nested attributes
  accepts_nested_attributes_for :poll_questions, :allow_destroy => true

  # Named scopes
  scope :published, :conditions => {:published => true}, :order => 'id DESC'
end
