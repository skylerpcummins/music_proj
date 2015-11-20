Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :index]
  resources :bands do
    resources :albums, only: :new
  end
  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: :new
  end
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  root to: redirect("/users")
end
