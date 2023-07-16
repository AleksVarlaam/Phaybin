# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    # Admin
    get '/admin' => redirect('/admins/sign_in')
    devise_for :admins, controllers: {
      registrations: 'admins/registrations', sessions: 'admins/sessions'
    }
    as :admin do
      namespace :admins do
        resources :categories
      end
    end
    
    # Content
    resources :categories, only: %i[ index show ] do 
      resources :images
    end
    # Contact form
    resources :contacts, only: [ :create ]

    # Root 
    root to: 'main#index'
  end
end
