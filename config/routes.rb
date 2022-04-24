Rails.application.routes.draw do
  get 'users/index'
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :tweets, only:[:create,:destroy]
  get '/:nickname', to: 'users#show'
end
