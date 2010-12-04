class PollsController < ApplicationController
  before_filter :authenticate, :only => :create

  def show
    @poll = Poll.published.first

    if @poll
      @poll_response = @poll.poll_responses.new
      @poll.poll_questions.each do |poll_question|
        @poll_response.poll_answers.build(:poll_question => poll_question)
      end
    end
  end

  def create
    @poll_response = current_user.poll_responses.new(params[:poll_response])
    @poll = @poll_response.poll

    if @poll_response.save
      flash[:notice] = t('poll.answer.notice')
      redirect_to poll_path
    else
      render 'show'
    end
  end
end
