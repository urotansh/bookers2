Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
              registrations: 'users/registrations'
  }
  get 'home/about', to: 'homes#about', as: :about
  
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  
  # #デバッグ用ルーティング
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
