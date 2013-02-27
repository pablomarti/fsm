Fosalud::Application.routes.draw do


  resources :human_records, :only=>[:index] do
    member do
    put  "victim_stabilized"
    match  "active_listening", :via=>[:get,:post]
    match  "heal_injuries", :via=>[:get,:post]
    match  "demand", :via=>[:get,:post]
    end
  end

  resources :humen


  resources :violence_kinds


  resources :system_cases


  resources :incident_kinds


  resources :physical_conditions


  resources :psycho_physio_alterations


  resources :emotional_conditions


  resources :weapon_kinds


  resources :aggression_kinds


  resources :zone_kinds


  resources :ocupations


  resources :civil_states


  resources :pregnancy_states


  resources :educational_levels


  resources :human_documents


  resources :document_types


  resources :cities


  resources :states


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :path => "d"
  resources :users
  resources :levels
  resources :roles

  get "main/index"

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

  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
