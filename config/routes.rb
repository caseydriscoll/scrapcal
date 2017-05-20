Rails.application.routes.draw do
  resources :projects do
    resources :proofs
  end

  resources :proofs
  resources :photos

  get 'home/index'

  patch 'projects/:id/generate', to: 'projects#generate'
  put   'projects/:id/generate', to: 'projects#generate'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
