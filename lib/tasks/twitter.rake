namespace :twitter do

  desc "Updates lists in database from Twitter account"
  task :update_lists => :environment do
    TWITTER_HTTP_AUTH.update_lists_in_database_from_twitter
  end

  desc "Updates subscriptions in database from Twitter account"
  task :update_subscriptions => :environment do
    TWITTER_HTTP_AUTH.update_subscriptions_in_database_from_twitter
  end

  desc "Updates lists and subscriptions in database from Twitter account"
  task :update => [:update_lists, :update_subscriptions] do
  end
end
