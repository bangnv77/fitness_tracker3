Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :foods
  end

  resources :users do
    resources :exercises
  end

  root to: "application#index"
end
