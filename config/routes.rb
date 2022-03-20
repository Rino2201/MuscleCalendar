Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "homes#top"
    get "/about", to: "homes#about"
    resources :users, only:[:index, :show, :edit, :update] do
      collection do
        get "quit"
        patch "out"
      end
    end
    resources :tweets do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :trainings
    resources :menus, only:[:index, :create, :edit, :update]
    resources :parts, only:[:index, :create, :edit, :update]
end
