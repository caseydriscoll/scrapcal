Rails.application.routes.draw do

  get   'home/index'
  get   'projects/:id.zip', to: 'projects#archive'
  patch 'projects/:id/generate', to: 'projects#generate'
  put   'projects/:id/generate', to: 'projects#generate'

  resources :projects do
    resources :proofs
  end

  resources :proofs
  resources :photos


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
