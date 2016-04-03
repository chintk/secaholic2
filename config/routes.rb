Rails.application.routes.draw do
  devise_for :users
  root to: "tools#index"

  resources :tools, except: [:edit, :update, :destroy]
end
