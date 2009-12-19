namespace :twitter do

  desc "Refreshes lists in database from the twitter account"
  task :refresh_lists => :environment do
    username = ConsumerConfig['user']['username']
    password = ConsumerConfig['user']['password']
    httpauth = Twitter::HTTPAuth.new(username, password)
    base = Twitter::Base.new(httpauth)
    base.lists(username).lists.each do |list|
      List.find_or_create_by_name(list.name)
    end
  end

end
