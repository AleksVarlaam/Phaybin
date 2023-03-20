# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
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
    get '/admin' => redirect('/admins/sign_in')
    
    get :gallery,   to: 'contents#gallery', as: 'gallery'
    get 'category/:id',  to: 'contents#category', as: 'category'
    get 'category/:category_id/image/:id',  to: 'admins/gallery/images#show', as: 'image'

    root to: 'contents#index'
  end
end
