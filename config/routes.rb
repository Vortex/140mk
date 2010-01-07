ActionController::Routing::Routes.draw do |map|
  map.error '/error', :controller => "welcome", :action => "error"

  map.root :controller => "welcome"
  map.resources :users
  map.resources :tweets, :collection => {:my => :get}
  map.resources :lists, :as => :categories
  map.resources :subscriptions
  map.resource :session, :collection => {:callback => :get}
end
