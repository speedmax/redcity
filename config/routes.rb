Redcity::Application.routes.draw do
  resources :countries

  resources :cities

  resources :messages, :except => [:edit, :update]
  resources :profiles do
    member do
      get :follow
      get :unfollow
    end
  end

  match '/:country_id/:id' => 'cities#show', :as => :city, 
    :constraints => { :country_id => /[a-z]{2}/, :id => /.+/ }
    # country city dispatch
  match '/:id' => 'countries#show', :as => :country,
    :constraints => { :id => /[a-z]{2}/ }

  # Account/Auth
  match '/login'                  => 'auth#new',      :as => :login
  match '/auth/:service/callback' => 'auth#callback'
  match '/auth/failure'           => 'auth#failure'
  match '/logout'                 => 'auth#destroy',  :as => :logout

  root :to => 'messages#index'
end
