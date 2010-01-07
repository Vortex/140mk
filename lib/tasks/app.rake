namespace :app do
  desc "Resets application (db drop, db create, db migrate, db seed, twitter get_users, twitter get_tweets)"
  task :reset => [:"db:drop", :"db:create", :"db:migrate", :"db:seed", :"twitter:get_users", :"twitter:get_tweets"] do
  end
end
