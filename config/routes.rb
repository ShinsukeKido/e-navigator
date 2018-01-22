Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :edit, :update] do
    resources :interviews
  end
  patch 'users/:user_id/interview/:id'  =>  'interviews#update2'
end
