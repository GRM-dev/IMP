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
      post '/lab/new' => 'laboratories#new', as: :new_lab
      post 'lab/new' => 'laboratories#create'
      post '/labs' => 'laboratories#index'
      resources :workstation
    end
    resources :building, only: [:create, :new], as: :buildings
  
    resources :dashboard, only: [:index] 
    get 'dashboard'                             => 'dashboard#index', as: :dashboard
    get 'dashboard/install'                     => 'building#new', as: :building_install
  
   # TO DO: Change GET to POST
    get '/users/user_mails.json'                => 'users#user_mails'
    
    scope :dashboard do
      post '/users'                      => 'users#index_for_dashboard'
      post '/users/invite_user_form'     => 'users#invite_new'
      post '/users/invite_user'          => 'users#invite_create'
      post '/users/permissions'          => 'users#edit_for_dashboard'
      post '/users/update_for_dashboard' => 'users#update_for_dashboard'
      post '/users/remove_user'          => 'users#remove_for_dashboard'
      
      post '/faq'                        => 'static_pages#faq'
      post '/issues'                     => 'dashboard#issues'
      
      post '/widgets'                    => 'dashboard#widgets_panel'
    end
    root to: redirect(status: 302) {|_,params, _| "/#{params[:locale]}/home"}
  end
  
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
end