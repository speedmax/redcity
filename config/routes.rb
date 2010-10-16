Redcity::Application.routes.draw do
  resources :messages, :except => [:edit, :update]
  resources :profiles
  
  root :to => 'profiles#index'
end
