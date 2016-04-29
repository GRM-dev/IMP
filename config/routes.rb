Rails.application.routes.draw do
  
  scope '/:locale', :locale => /#{I18n.available_locales.join("|")}/ do
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    get '/home' => 'home_pages#index', as: :home
    get '/about' => 'static_pages#about', as: :about
    get '/galery' => 'static_pages#galery', as: :galery
    get '/contact' => 'static_pages#contact', as: :contact
    get '/user/:id' => 'users#show', as: :account
    
    namespace :building do
      get '/lab/new' => 'laboratories#new', as: :new_lab
      post 'lab/new' => 'laboratories#create'
      get '/labs' => 'laboratories#index'
      resources :workstation
    end
  
    resources :dashboard, only: [:index]
    get 'dashboard' => 'dashboard#index', as: :dashboard
    get 'dashboard/install' => 'building#new', as: :building
    resources :building, only: [:create], as: :buildings
  
    post 'invite_user' => 'users#invite_new'
    get 'users/user_mails.json' => 'users#user_mails'
    post 'users/invite_user' => 'users#invite_user'
    
    root to: redirect(status: 302) {|_,params, _| "/#{params[:locale]}/home"}
  end
  
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
  # get '*path' => redirect('/404')
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
