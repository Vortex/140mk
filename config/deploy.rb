# Application
set :application, "140mk"
set :deploy_to, "/home/blitzkrieg/apps/#{application}"

# Settings
default_run_options[:pty] = true
set :use_sudo, true

# Servers
set :user, "blitzkrieg"
set :domain, "blitzkrieg.mk"
server domain, :app, :web
role :db, domain, :primary => true

# Git
set :scm, :git
set :repository,  "ssh://git@blitzkrieg.mk/home/git/140mk.git"

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/twitter.yml #{release_path}/config/twitter.yml"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'