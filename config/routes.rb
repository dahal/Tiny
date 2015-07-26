Rails.application.routes.draw do
  root 'long_urls#index'
  
  resources :long_urls, only: [:index, :new, :create], path: ''
  
  #redirect
  get '/:uri' => 'short_urls#redirect'
  
  # errors
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
