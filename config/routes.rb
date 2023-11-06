Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'user/homes#top'
  
  namespace :user do
    resources :novels, only: [:new, :create, :index, :show, :destroy]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
