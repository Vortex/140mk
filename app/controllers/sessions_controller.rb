class SessionsController < ApplicationController
  def create
    # oauth.set_callback_url(callback_session_url)
    request_token = oauth_consumer.get_request_token(:oauth_callback => callback_session_url)
    
    # sets consumer token and secrets in session
    session['rtoken']  = request_token.token
    session['rsecret'] = request_token.secret
    
    redirect_to request_token.authorize_url.sub("http:", "https:")
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def callback
    # TODO: Remove the old and deprecated stuff once this is stable
    # oauth authorization with consumer token and secret, and oauth verifier from twitter oauth app verification
    # oauth.authorize_from_request(session['rtoken'], session['rsecret'], params[:oauth_verifier])
    request_token = OAuth::RequestToken.new(oauth_consumer, session['rtoken'], session['rsecret'])
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    reset_session
    
    session['access_token']  = access_token.token
    session['access_secret'] = access_token.secret
    
    # profile = Twitter::Base.new(oauth).verify_credentials
    profile = client.verify_credentials
    user = User.find_by_screen_name(profile.screen_name)

    unless user
      user = User.new
      user.screen_name = profile.screen_name
      new_user = {:new_user => "true"}
    end

    user.save_with_profile_and_oauth(profile, access_token)

    sign_in(user)
    redirect_to current_user.has_subscriptions? ? root_url : settings_url(new_user)
  # rescue Twitter::Unavailable
    #TODO design for error_page
   # flash[:error] = "Twitter API problems. Please try again later"
   # redirect_to error_path
  end

  private
  #  def oauth
  #    @oauth ||= Twitter::OAuth.new(ConsumerConfig['consumer']['token'], ConsumerConfig['consumer']['secret'], :sign_in => true)
  #  end
end
