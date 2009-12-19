namespace :twitter do

  desc "Refreshes lists in database from the twitter account"
  task :refresh_lists => :environment do
    twitter_auth = TwitterHttpAuth.new
    twitter_auth.base.lists(twitter_auth.username).lists.each do |list|
      List.find_or_create_by_name(list.name)
    end
  end

end
