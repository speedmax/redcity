Redcity::Application.routes.draw do
  resources :messages
  resources :profiles
  
  root :to => 'profiles#index'
end
