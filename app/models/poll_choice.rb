class PollChoice < ActiveRecord::Base

  # Validations
  validates_presence_of :name

  # Associations
  belongs_to :poll_question
  has_many :poll_answers, :dependent => :destroy
end
