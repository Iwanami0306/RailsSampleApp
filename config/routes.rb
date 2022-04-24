Rails.application.routes.draw do
  get 'users/index'
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :tweets, only:[:create,:destroy]
  get '/:nickname/followers', to:'users#show_followers'
  get '/:nickname/followings', to:'users#show_followings'
  get '/:nickname', to: 'users#show'
  resources :follow_relationships, only:[:create,:destroy]
end
