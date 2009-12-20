class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  after_create :add_user_to_list
  after_destroy :remove_user_from_list

  def add_user_to_list
    TWITTER_HTTP_AUTH.base.list_add_member(TWITTER_HTTP_AUTH.username, list.name, user.twitter_id)
  end

  def remove_user_from_list
    TWITTER_HTTP_AUTH.base.list_remove_member(TWITTER_HTTP_AUTH.username, list.name, user.twitter_id)
  end
end
