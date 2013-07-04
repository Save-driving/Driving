Driving::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get "users/index"

  get "users/show"

  get "users/new"

  get "users/create"

  get "users/edit"

  get "users/update"

  get "users/destroy"

  resources :aseguradoras


  resources :transitos


  resources :bomberos


  resources :ambulancias


  resources :mecanicos


  resources :parqueaderos


  resources :conductores


  resources :abogados


  resources :desplazamientos


  resources :gruas


  resources :carrotalleres


  resources :talleres


  get "welcome/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

  resources :municipios do 
    get :autocomplete_departamento_nombre, :on => :collection
  end


  resources :departamentos do
    get :autocomplete_pais_nombre, :on => :collection
  end


  resources :calificaciones


  resources :documentos


  resources :paises do
    resources :departamentos
  end


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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
