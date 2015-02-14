Rails.application.routes.draw do
  resources :tracks

  get 'pages/home' => 'pages#home'

  get 'pages/about' =>'pages#about'

  get 'broadcasts/timeline' =>'broadcasts#timeline'

  resources :broadcasts
  
  root 'broadcasts#index'
end
