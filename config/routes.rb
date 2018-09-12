Rails.application.routes.draw do
  root 'home#index'

  get '/join' => 'users#new', as: :join
  post '/join' => 'users#join'
end
