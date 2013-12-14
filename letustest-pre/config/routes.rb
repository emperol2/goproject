Letustest::Application.routes.draw do

  resources :comments


  resources :issues do
    member do
      #put '/issues/:id/approvalstatus' => 'issues#approvalstatus', :as => 'approvalstatus'

    end
    resources :comments
  end


  resources :testers


  resources :feedbacks do
    member do
      get 'status'
      get 'showall'
      get 'mybug'
      get 'description'
      get 'rule'
      get 'manage'
      get 'testers'
      get 'description2'
      get 'seetesters'
      get 'promote'
      get 'contact'
    end

    resources :issues
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :playgrounds

  put '/issues/:id/approvalstatus' => 'issues#approvalstatus', :as => 'approvalstatus'
  get '/users/:id/projects' => 'users#projects', :as => 'projects'


  #get "users/new" ;was removed and added next line

  # it endows our sample application with all the actions needed for a RESTful Users resource

  resources :users do

    member do
      get 'manage'
      get 'basicinfo'
      get 'setting'
      get 'projects'
      get 'payment'
    end

  end

  get "home/index"
  #match "/status" => "feedbacks#status", :as => :status
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/plans', to: 'pages#plans'
  match '/companyinfo', to: 'pages#companyinfo'
  match '/help', to: 'pages#help'
  match '/contactus', to: 'pages#contactus'
  match '/projects', to: 'testers#projects'
  #match '/assigned', to: 'testers#assigned'

  put '/projects/assigned' => 'testers#assigned', :as => 'assigned'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => "home#index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
