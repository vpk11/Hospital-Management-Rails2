ActionController::Routing::Routes.draw do |map|

 map.root :controller =>:users

 map.resources :users , :collection => {:login => :post, :logout => :get }
 map.resources :admins , :has_many => [:doctors, :patients],
   :collection => {:list_beds => :get, :show_doctors => :get, :show_patients => :get,:show_wards => :get, :show_departments => :get, :manage_appointments => :get,:manage_bed_assignments => :get, :new_ward => :get, :create_ward => :post, :new_department => :get, :create_department => :post, :new_bed_assignment => :get, :create_bed_assignment => :post, :new_bed => :get, :create_bed => :post }, 
   :member =>{:destroy_bed => :post , :destroy_ward => :post,:destroy_appointment => :post,:destroy_bed_assignment => :post,:show_beds => :get}
 map.resources :patients , :collection => {:get_appointments => :get, :create_appointment => :post, :list_doctors => :get}
 map.resources :doctors



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

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '*path', :controller =>:users

end
