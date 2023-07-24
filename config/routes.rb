Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get '/home/about' => "homes#about", as: :about
  get '/customers/unsubscribe' => "customers#unsubscribe", as: :unsubscribe
  get '/customers/withdrawal' => "customers#withdrawal", as: :withdrawal
  delete '/cart_items/destroy_all' => "cart_items#destroy_all", as: :destroy_all
  post '/orders/confirm' => "orders#confirm", as: :confirm
  get '/orders/completed' => "orders#completed", as: :completed
  resources :items, only: [:show, :index]
  resources :customers, only: [:show, :edit, :update, :withdrawal]
  resources :cart_items, only: [:create, :destroy, :update, :index]
  resources :orders, only: [:show, :edit, :update, :index, :new]
  resources :order_details, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
