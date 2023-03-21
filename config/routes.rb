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
        resources :categories, module: :gallery do
          resources :images
        end
      end
    end
    
    # Content
    get :gallery,   to: 'contents#gallery', as: 'gallery'
    get 'category/:id',  to: 'contents#category', as: 'category'
    get 'category/:category_id/image/:id',  to: 'admins/gallery/images#show', as: 'image'
    
    # Contact form
    resources :contacts, only: [ :create ]

    # Root 
    root to: 'contents#index'
  end
end
