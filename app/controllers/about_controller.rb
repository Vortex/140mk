class AboutController < ApplicationController

  def index
    user = User.find_by_screen_name(G140[:prod_account])
    @tweets = user.tweets
  end

end