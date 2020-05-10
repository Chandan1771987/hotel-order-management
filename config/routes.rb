Rails.application.routes.draw do

  devise_for :users
  resources :order_delivery_info, only: [:index, :create, :show, :update, :edit, :new, :destroy]

  resources :order_payment_info, only: [:index, :create, :show, :update, :edit, :new, :destroy]

  resources :orders, only: [:index, :create, :show, :update, :destroy, :edit, :new]

  resources :menu_items, only: [:index, :create, :show, :update, :destroy, :edit, :new]

  resources :customer_infos, only: [:index, :create, :show, :update, :destroy, :edit, :new]
  root to: "orders#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
