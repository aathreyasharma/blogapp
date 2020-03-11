Rails.application.routes.draw do
  root to: "post#index"

  devise_for :users

  resources :post do
  	post 'comments', to: 'comments#create'
  end


end
