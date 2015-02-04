Rails.application.routes.draw do
  get 'pages/home' => 'pages#home'

  get 'pages/about' =>'pages#about'

  root 'pages#home'
end
