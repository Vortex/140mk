class FetchTweetsJob
  include Jobs::ScheduledJob

  run_every 1.minute

  def perform
    TwitterAccess.get_tweets
  end
end
