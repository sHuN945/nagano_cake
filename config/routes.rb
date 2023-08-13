Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  scope module: :public do
    root to: 'homes#top'
    resources :items, only: [:show, :index]
    get 'customers/unsubscribe' => "customers#unsubscribe", as: :unsubscribe
    patch 'customers/withdrawal' => "customers#withdrawal"
    get 'customers', to: 'customers#show'
    get 'customers/edit', to: "customers#edit"
    patch 'customers', to: "customers#update"
    resources :cart_items, only: [:create, :destroy, :update, :index] do 
      member do 
        patch 'increase'
        patch 'decrease'
      end 
    end 
    resources :orders, only: [:show, :edit, :update, :index, :new]
    resources :order_details, only: [:show, :edit, :update, :index]
  end 
    get '/home/about' => "homes#about", as: :about
    
    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }
    
    delete '/cart_items/destroy_all' => "cart_items#destroy_all", as: :destroy_all
    post '/orders/confirm' => "orders#confirm", as: :confirm
    get '/orders/completed' => "orders#completed", as: :completed

  
  namespace :admin do
    get '/' => "homes#top"
    resources :items, only: [:edit, :new, :show, :index, :create, :update]
    resources :customers, only: [:edit, :update, :show, :index]
    resources :orders, only: [:show, :update]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
