# frozen_string_literal: true

Rails.application.routes.draw do
  get '/guests', to: redirect('/guests.html')

  root 'welcome#index'
end
