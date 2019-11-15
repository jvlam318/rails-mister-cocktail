Rails.application.routes.draw do
  get 'ingredients/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: [ :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [ :show, :destroy ]
  resources :ingredients, only: [ :show ]
end
