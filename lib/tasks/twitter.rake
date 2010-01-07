namespace :twitter do
  desc "Collects newest tweets from home account (140mk) timeline and saves then into database"
  task :get_tweets => :environment do
    TWITTER_HTTP_AUTH.get_tweets
  end

  desc "Collects users from home account (140mk) and saves them into database"
  task :get_users => :environment do
    TWITTER_HTTP_AUTH.get_users
  end
end
