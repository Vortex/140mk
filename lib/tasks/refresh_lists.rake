namespace :twitter do

  desc "Refreshes lists in database from the twitter account"
  task :refresh_lists => :environment do
    twitter_auth = TwitterHttpAuth.new
    twitter_auth.refresh_lists_in_database
  end

end
