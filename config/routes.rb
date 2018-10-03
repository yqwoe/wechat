Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]
  resources :posts
  root to: 'home#index'
  post '/', to: 'home#create'


  match '*path', via: :all, to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
