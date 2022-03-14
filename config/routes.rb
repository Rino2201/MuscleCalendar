Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "homes#top"
    get "/about", to: "homes#about"
    resources :users, only:[:index, :show, :edit, :update] do
      collection do
        patch "out"
      end
    end
    resources :tweets
    resources :trainings
    resources :menus, only:[:index, :create, :edit, :update]
    resources :parts, only:[:index, :create, :edit, :update]
end
