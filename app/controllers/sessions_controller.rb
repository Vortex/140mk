class SessionsController < ApplicationController

  def create
    oauth.set_callback_url(callback_session_url)
    
    # sets consumer token and secrets in session
    session['rtoken']  = oauth.request_token.token
    session['rsecret'] = oauth.request_token.secret
    
    redirect_to oauth.request_token.authorize_url
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def callback
    # oauth authorization with consumer token and secret, and oauth verifier from twitter oauth app verification
    oauth.authorize_from_request(session['rtoken'], session['rsecret'], params[:oauth_verifier])
    
    session['rtoken']  = nil
    session['rsecret'] = nil
    
    profile = Twitter::Base.new(oauth).verify_credentials
    user    = User.find_or_create_by_screen_name(profile.screen_name)
    
    user.update_attributes({
      :atoken => oauth.access_token.token, 
      :asecret => oauth.access_token.secret,
    })
    
    sign_in(user)
    redirect_back_or root_path
  end

  private
    def oauth
      @oauth ||= Twitter::OAuth.new(ConsumerConfig['consumer']['token'], ConsumerConfig['consumer']['secret'], :sign_in => true)
    end
end
