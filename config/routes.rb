Rails.application.routes.draw do
  root 'long_urls#index'
  
  resources :long_urls, only: [:index, :new, :create], path: ''
  
  #redirect
  get '/:uri' => 'short_urls#redirect'
end
