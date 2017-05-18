Rails.application.routes.draw do
  resources :projects do
    resources :prints
  end

  resources :photos

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
