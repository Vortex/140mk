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
    sign_in(request.env['omniauth.auth'])
    redirect_to root_path
  end
end
