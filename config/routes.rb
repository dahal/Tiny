Rails.application.routes.draw do
  root 'long_urls#index'
  
  resources :long_urls, only: %i(index create)
end
