class SessionsController < ApplicationController
#  def create
    ## oauth.set_callback_url(callback_session_url)
    #request_token = oauth_consumer.get_request_token(:oauth_callback => callback_session_url)
    
    ## sets consumer token and secrets in session
    #session['rtoken']  = request_token.token
    #session['rsecret'] = request_token.secret
    
    #redirect_to request_token.authorize_url.sub("http:", "https:")
  #end

  def destroy
    reset_session
    redirect_to root_path
  end

  def error
    redirect_to root_path, :alert => "Sign in with twitter failed!"
  end

  def callback
    # Sign in on twitter
    sign_in(request.env['omniauth.auth'])

    # Check if user exists
    screen_name = session[:screen_name]
    user = User.find_by_screen_name(screen_name)
    twitter_profile = client.user(screen_name)

    unless user
      user = User.new
      user.screen_name = twitter_profile.screen_name
      new_user = { :new_user => "true" }
    end

    user.save_with_profile_and_oauth(twitter_profile, nil)

    # redirect_to current_user.has_subscriptions? ? root_url : settings_url(new_user)
    redirect_to root_url
  end
end
