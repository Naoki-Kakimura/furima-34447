Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :orders, only:[:new,:create]
  end
  root "items#index"
end
