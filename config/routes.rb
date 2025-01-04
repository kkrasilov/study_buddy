# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get '/guests', to: redirect('/guests.html')

  root 'groups#index'

  resources :welcome, only: :index
  resources :users, only: %i[edit update] do
    get :profile, on: :collection
  end
end
