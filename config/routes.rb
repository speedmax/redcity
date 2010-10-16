Redcity::Application.routes.draw do
  resources :messages, :except => [:edit, :update]
  resources :profiles
  

  # Account/Auth
  match '/login'                  => 'auth#new',      :as => :login
  match '/auth/:service/callback' => 'auth#callback'
  match '/auth/failure'           => 'auth#failure'
  match '/logout'                 => 'auth#destroy',  :as => :logout

  root :to => 'profiles#index'
end
