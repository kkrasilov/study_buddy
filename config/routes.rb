# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get '/guests', to: redirect('/guests.html')

  root 'welcome#index'
end
