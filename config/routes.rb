Rails.application.routes.draw do
  
  # ユーザー
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  # 管理者
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'user/homes#top'
  get 'user/homes/about', to: 'user/homes#about', as: 'about'
  
  
  #user
  
  scope module: :user do
    
    get 'search', to: 'search#search', as: 'search'
    
    resources :novels, only: [:index,:show,:edit,:create,:destroy,:update, :new] do
      resources :novel_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      
      member do
        get :bookmarks, only: [:index]
      end
    
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search" => "users#search"
        
    end
  end
    
  #guest_user
  devise_scope :user do
    post "users/guest_sign_in", to: "user/sessions#guest_sign_in"
  end
    
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end