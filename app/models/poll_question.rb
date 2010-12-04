class PollQuestion < ActiveRecord::Base

  # Validations
  validates_presence_of :name

  # Associations
  belongs_to :poll
  has_many :poll_choices, :dependent => :destroy

  # Model can accept nested attributes
  accepts_nested_attributes_for :poll_choices, :allow_destroy => true
end
