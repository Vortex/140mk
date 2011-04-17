module Twitter
  module AuthenticationHelpers
    def self.included(controller)
      controller.class_eval do
        helper_method :signed_in?
        hide_action :signed_in?
      end
    end

    def signed_in?
      # !session[:screen_name].nil?
      session[:screen_name] && session[:access_token] && session[:access_secret]
    end

    protected

    def authenticate
      deny_access unless signed_in?
    end

    def deny_access
      store_location
      render :template => "/sessions/new", :status => :unauthorized
    end

    def sign_in(auth)
      if auth
        session[:screen_name] = auth['user_info']['nickname']
        session[:access_token] = auth['credentials']['token']
        session[:access_secret] = auth['credentials']['secret']
      end
    end

    def redirect_back_or(default)
      session[:return_to] ||= params[:return_to]
      if session[:return_to]
        redirect_to(session[:return_to])
      else
        redirect_to(default)
      end
      session[:return_to] = nil
    end

    def store_location
      session[:return_to] = request.request_uri if request.get?
    end
  end
end
