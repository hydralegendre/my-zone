Rails.application.routes.draw do
  get 'notification/lists'
  get 'message/list'
  get 'message/privatemessage'
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/components', to: 'pages#components'

  resources :users, only: [:edit, :update, :show]

  resources :zones, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :zone_tags
  end

  resources :posts do
    member do
      post 'good'
    end
    resources :comments, only: [:new, :create]
  end



  get '/test', to: 'pages#test'
end
