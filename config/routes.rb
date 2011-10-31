T140mk::Application.routes.draw do

  # Resources
  resources :users do
    collection do
      post 'follow'
    end
  end

  resources :tweets do
    collection do
      get 'my'
      post 'refresh'
      post 'by_hashtag'
    end
  end

  resources :categories do
    member do
      post 'create_on_twitter'
    end
  end

  resources :configurations
  resources :subscriptions
  resources :tags, :only => [ :index, :show ] do
    collection do
      post 'by_period'
    end
  end

  resource :session do
    collection do
      get 'callback'
    end
  end

  resource :poll

  namespace :admin do
    root :to => "welcome#index"
    resources :polls
  end

  # Regular routes
  get '/auth/twitter/callback', :to => 'sessions#callback', :as => :callback
  get '/auth/failure', :to => 'sessions#error', :as => :error
  delete '/logout', :to => 'sessions#destroy', :as => :logout
  #match 'login' => 'sessions#create'
  #match 'logout' => 'sessions#destroy'
  match 'settings' => 'settings#index'
  match 'deactivate' => 'users#deactivate'
  match 'about' => 'about#index'
  match 'error' => 'welcome#error'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # Root
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
