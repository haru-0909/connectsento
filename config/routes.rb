Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: :about
    get 'search', to: 'searchs#search'
    resources :posts do
      member do
        get :map
      end
      resource :favorites, only: [:create, :destroy]
      resources :comments,  only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites
        get :follows, :followers #フォロー一覧とフォロワー一覧
      end
      resource :relationships, only: [:create, :destroy]
    end
  end

  get '/search', to: 'searchs#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
