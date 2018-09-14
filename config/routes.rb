Rails.application.routes.draw do
  root 'home#index'

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
