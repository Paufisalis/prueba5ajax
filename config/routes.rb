Rails.application.routes.draw do
  resources :complaints, except: [:create]
  resources :companies do
  resources :complaints
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'
end
