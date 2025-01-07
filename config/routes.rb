# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get '/guests', to: redirect('/guests.html')

  root 'groups#index'

  resources :welcome, only: :index
  resources :groups do
    resources :documents, only: %i[create destroy], module: 'groups'
    post :join, on: :collection
  end
  resources :articles, only: %i[index new create edit update show]
  resources :users, only: %i[edit update] do
    get :profile, on: :collection
  end
end
