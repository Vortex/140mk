class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  after_create :add_user_to_list
  after_destroy :remove_user_from_list

  def add_user_to_list
    twitter_auth = TwitterHttpAuth.new
    twitter_auth.base.list_add_member(twitter_auth.username, list.name, user.twitter_id)
  end

  def remove_user_from_list
    twitter_auth = TwitterHttpAuth.new
    twitter_auth.base.list_remove_member(twitter_auth.username, list.name, user.twitter_id)
  end
end
