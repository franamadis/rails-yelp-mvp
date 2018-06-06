Rails.application.routes.draw do
  # get 'content/rating:integer'
  resources :restaurants do
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  root to: 'restaurants#index'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


