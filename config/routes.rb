ActionController::Routing::Routes.draw do |map|

  map.root :controller => "homepage"

  map.signup '/signup', :controller => "users", :action => "new"
  map.login  '/login', :controller => "user_sessions", :action => "new"
  map.logout '/logout', :controller => "user_sessions", :action => "destroy"
  map.dashboard '/dashboard', :controller => "homepage", :action => "dashboard"
  map.about '/about', :controller => "homepage", :action => "about"

  
  #this generates a nice url for the balance sheet
  map.balance 'balance/:year/sheet', :controller => "balance", :action => "sheet",
      :year => /\d+/
  # this is to keep the url for the year view simple
  map.balance 'balance/:year/:month', :controller => "balance", :action => "show",
      :year => /\d+/, :month => /\d+/
  map.balance 'balance/:year', :controller => "balance", :action => "show",
      :year => /\d+/

  #RESTful Routes
  map.resources :bills, :member => { :close => :post}, :has_many => :positions
  map.resources :clients
  map.resources :expenditures
  map.resources :users, :only => [:new, :create]
  map.resources :companies
  map.resources :company_logos, :except => [:index, :edit, :update]

  map.resource :user_session

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"
end
