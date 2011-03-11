Projecttwo::Application.routes.draw do
	#Login Route
	root :to => "pages#login"
  match "pages/login", :via => [:get,:post]
  
  #Login continue page
  match "pages/continue" => "pages#continue"

  #Logout Route
  get "pages/logout"
 
  #User Routes
  get "users/new" 
  #user main route
  match "users/index" => "users#index", :via => [:get,:post]
  #User edit route
  match "users/edit" => "users#edit", :via => [:get,:post]
  #User creation route
  match "users/create" => "users#create"
  #User selection route
  match "users/chooseUser" => "users#chooseUser"
  #User update route
  match "users/update" => "users#update"
  
	#User_Suggestion Routes
	#User_suggestion main route
  match "user_suggestions/index" => "user_suggestions#index", :via => [:get,:post]
    #User_suggestion creation route
  match "user_suggestions/create" => "user_suggestions#create"
  #User_suggestion new route
  match "user_suggestions/new" => "user_suggestions#new"
  #user_suggestion edit route
  match "user_suggestions/edit" => "user_suggestions#edit"
  #user_suggestion update route
  match "user_suggestions/update" => "user_suggestions#update"
  #user_suggestion selectino route
  match "user_suggestions/chooseSuggestion" => "user_suggestions#chooseSuggestion"
	
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
