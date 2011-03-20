module Twitter
  module AuthenticationHelpers
    def self.included(controller)
      controller.class_eval do
        helper_method :signed_in?
        hide_action :signed_in?
      end
    end

    def signed_in?
      !session[:screen_name].nil?
    end

    protected

    def authenticate
      deny_access unless signed_in?
    end

    def deny_access
      store_location
      render :template => "/sessions/new", :status => :unauthorized
    end

    def sign_in(user)
      session[:screen_name] = user.screen_name if user
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

#module Twitter
  #module AuthenticationHelpers
    #def self.included(controller)
      #controller.send :include, InstanceMethods
      
      #controller.class_eval do
        ## helper_method :current_user
        #helper_method :signed_in?

        #hide_action :current_user, :signed_in?
      #end
    #end
    
    #module InstanceMethods
      #def current_user
        #@_current_user ||= user_from_session
      #end

      #def signed_in?
        #!current_user.nil?
      #end

      #protected
        #def authenticate
          #deny_access unless signed_in?
        #end

        #def user_from_session
          #if session[:user_id].present?
            #User.find_by_id(session[:user_id])
          #end
        #end

        #def sign_in(user)
          #if user
            #session[:user_id] = user.id
          #end
        #end

        #def redirect_back_or(default)
          #session[:return_to] ||= params[:return_to]
          #if session[:return_to]
            #redirect_to(session[:return_to])
          #else
            #redirect_to(default)
          #end
          #session[:return_to] = nil
        #end

        #def redirect_to_root
          #redirect_to root_url
        #end

        #def store_location
          #session[:return_to] = request.request_uri if request.get?
        #end

        #def deny_access(flash_message = nil, opts = {})
          #store_location
          #flash[:failure] = flash_message if flash_message
          ##render :template => "/sessions/new", :status => :unauthorized
          #redirect_to_root
        #end
    #end
  #end
#end
