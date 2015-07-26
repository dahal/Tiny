Rails.application.routes.draw do
  root 'long_urls#index'
  
  resources :long_urls, only: [:index, :new, :create]
end
