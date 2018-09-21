Rails.application.routes.draw do
  devise_for :users

  root 'bands#index'

  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :uploads, only: [:new, :create, :show, :index]
  resources :bands, only: [:new, :create, :edit, :update, :show, :index]
  resources :folders, only: [:new, :create, :edit, :update, :show, :index]
  resources :gigs, only: [:new, :create, :edit, :update, :show, :index]
  resources :tasks, only: [:new, :create, :edit, :update, :show, :index]

  namespace :admin do
    # Distinct from the normal dashboards#index!
    root 'dashboards#index'

    resources :dashboards, only: [:index]
    resources :bands, only: [:index, :show]
    resources :users, only: [:index, :show]
  end

  mount ActionCable.server => '/cable'
end
