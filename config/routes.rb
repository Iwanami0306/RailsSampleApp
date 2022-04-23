Rails.application.routes.draw do
  get '/:nickname', to: 'users#show'
  get 'users/index'
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :tweets, only:[:create,:destroy]
end
