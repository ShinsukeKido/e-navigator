Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'interviews#index'
  resources :users, only: [:edit, :update] do
    resources :interviews
  end
end
