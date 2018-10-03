Rails.application.routes.draw do
  resource :wechat, only: [:index,:show, :create]
  resources :posts


  match '*path', via: :all, to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
