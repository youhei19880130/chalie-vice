Rails.application.routes.draw do
  root 'tool#index'

  resources :items
  resources :makers

  post '/order', to: 'tool#order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
