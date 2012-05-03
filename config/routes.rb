AsianWeek::Application.routes.draw do
  



  get "users" => "home#index"
  get "admins" => "home#index"
  get "userz" => "users#index"
  
  resources :categories do
	resources :posts
  end

  resources :relationships, only: [:create, :destroy]
  
  resources :attachments

  resources :organisations

  resources :events

  resources :posts do
	match :publish
  end
  
  devise_for :admins, :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" } do
	 get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  get "/admins/sign_out" => "devise/sessions#destroy", :as => :destroy_admin_session
  end
#  devise_for :admins

  resources :users do
	match :approve
  end

  #resources :admins
	
  get "home/index"
  get 'profile' => 'users#profile'
  match 'publishpost' => 'posts#publish'
  match 'featurepost' => 'posts#feature'
  get 'calendar' => 'events#calendar'

  get 'organizations_feed' => 'home#index', :feed => 1
  get 'contributors_feed' => 'home#index', :feed => 2
  get 'feed' => 'home#index', :feed => 3

  get 'all' => 'home#index', :feed => 0
  get 'neighborhoods' => 'home#neighborhoods', :feed => 1
  get 'regenerate_thumbnails' => 'home#thumbs'
  get 'contributors' => 'home#contributors'

  match 'rss' => 'home#xmls'
  match 'rss/:feed' => 'home#xmls'

  match 'approve/:id' => "users#approve"
  post 'follow_user/:id' => "relationships#follow"

  
  

  	
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
    get '/login' => "devise/sessions#new"
	
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'home#index', :feed => 0

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
