Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: 'homes#top'
  get '/home/about' => "homes#about", as: :about
  resources :items, only: [:show, :index]
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :cart_items, only: [:create, :destroy, :destroy_all, :update, :index]
  resources :orders, only: [:show, :edit, :update, :index]
  resources :order_details, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
