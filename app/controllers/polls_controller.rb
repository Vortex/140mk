class PollsController < ApplicationController
  before_filter :authenticate, :only => :create
  before_filter :get_filtered_tweets, :only => [:show, :create]
  before_filter :get_trending_tags, :only => [:index, :show, :create]

  def show
    @poll = Poll.published.first
    
    if @poll
      # Notice if user is not logged in
      unless current_user
        flash.now[:notice] = t('poll.not_logged')
      end
      
      if current_user && current_user.has_taken_poll?(@poll)
        flash.now[:notice] = t('poll.already_taken')
      end

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
