Rails.application.routes.draw do
  devise_for :users
  root to: "post#index"
  
  # get 'post', to: "post#new"
  resources :post#, only: [:destroy, :create, :show, :edit, :update, :index, :new]

  # delete '/post/:id', to: "post#destroy", as: 'delete_post_path'

end
