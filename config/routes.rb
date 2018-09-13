Rails.application.routes.draw do
  root 'users#new'

  get '/home' => 'home#index', as: :home
  get '/join' => 'users#new', as: :join
  post '/join' => 'users#join'
  get '/users/:id' => 'users#show', as: :user
  
  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end
