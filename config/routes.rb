Rails.application.routes.draw do
  
  get 'searches/search'
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'user/homes#top'
  
  get '/about', to: 'user/homes#about', as: 'about'
  
  namespace :user do
    
    resources :novels, only: [:new, :create, :index, :show, :destroy] do
      resources :novel_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      
      member do
        get :bookmarks
      end
      
    end
    

      
    get 'search', to: 'search#search', as: 'search'
    
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end