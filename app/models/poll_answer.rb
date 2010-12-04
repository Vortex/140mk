class PollAnswer < ActiveRecord::Base

  # Associations
  belongs_to :poll_response
  belongs_to :poll_question
  belongs_to :poll_choice, :counter_cache => true

  # Validatoins
  validates_presence_of :poll_question_id, :poll_choice_id
end
