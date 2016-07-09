Rails.application.routes.draw do
  
  scope '/:locale', :locale => /#{I18n.available_locales.join("|")}/ do
    get '/login'                          => 'sessions#new'
    post '/login'                         => 'sessions#create'
    delete '/logout'                      => 'sessions#destroy'
    get '/home'                           => 'home_pages#index', as: :home
    get '/about'                          => 'static_pages#about', as: :about
    get '/galery'                         => 'static_pages#galery', as: :galery
    get '/contact'                        => 'static_pages#contact', as: :contact
    get '/user/:id'                       => 'users#show', as: :account
    
    namespace :building do
      post '/lab/new'                     => 'laboratories#new', as: :new_lab
      post 'lab/create'                   => 'laboratories#create'
      post '/labs'                        => 'laboratories#index'
      resources :workstation
    end
    resources :building, only: [:create, :new], as: :buildings
  
    get 'dashboard'                       => 'dashboard#index', as: :dashboard
    get 'dashboard/install'               => 'building#new', as: :building_install
    resources :dashboard, only: [:index]

   # TO DO: Change GET to POST
    get '/users/user_mails.json'          => 'users#user_mails'

    scope :dashboard do
      post '/users'                       => 'users#index_for_dashboard'
      scope :users do
        post '/invite_user_form'          => 'users#invite_new'
        post '/invite_user'               => 'users#invite_create'
        post '/permissions'               => 'users#edit_for_dashboard'
        post '/update_for_dashboard'      => 'users#update_for_dashboard'
        post '/remove_user'               => 'users#remove_for_dashboard'
      end
      post '/groups'                      => 'groups#index_for_dashboard', as: :groups
      scope :groups do
        post '/manage'                    => 'groups#manage'
        post '/add_group'                 => 'groups#new'
        post '/remove_group'              => 'groups#remove_group'
        post '/create'                    => 'groups#create'
      end

      post '/faq'                         => 'static_pages#faq', as: :faq
      post '/issues'                      => 'dashboard#issues', as: :issues
      
      post '/widgets'                     => 'dashboard#widgets_panel', as: :widgets
    end
    root to: redirect(status: 302) {|_,params, _| "/#{params[:locale]}/home"}
  end
  
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
end