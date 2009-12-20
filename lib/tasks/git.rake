namespace :git do
  desc "Remove deleted files from the git index"
  task :remove do
    system("for i in $(git status | grep deleted | awk '{print $3}'); do git rm $i; done")
  end
end
