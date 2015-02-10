Rails.application.routes.draw do
  resources :tracks

  get 'pages/home' => 'pages#home'

  get 'pages/about' =>'pages#about'

  resources :broadcasts
  
  root 'pages#home'
end
