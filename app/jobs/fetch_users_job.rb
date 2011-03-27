class FetchUsersJob
  include Jobs::ScheduledJob

  run_every 6.hours

  def perform
    TwitterAccess.get_users
  end

end
