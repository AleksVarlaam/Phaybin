# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.default_url_options[:host] =
  Rails.env.production? ? 'http://phaybin.fly.dev' : 'localhost:3000'
Rails.application.routes.draw do
  # WWW redirect
  match '(*any)',
        to: redirect(subdomain: ''),
        via: :all,
        constraints: { subdomain: 'www' }

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    # Root path
    root to: 'main#index'
    # Sitemap
    get 'sitemap.xml', to: 'main#sitemap', format: 'xml', as: :sitemap
    # Robots
    get 'robots.txt',  to: 'main#robots',  format: 'txt', as: :robots
    # Favicon
    get 'favicon.png', to: 'main#favicon', format: 'png', as: :favicon

    # Admin
    get '/admin' => redirect('/admins/sign_in')
    devise_for :admins, controllers: {
      registrations: 'admins/registrations', sessions: 'admins/sessions'
    }, skip: %i[registrations confirmations]
    as :admin do
      get 'admins/edit',  to: 'admins/registrations#edit',    as: 'edit_admin_registration'
      put 'admins',       to: 'admins/registrations#update',  as: 'admin_registration'
      namespace :admins do
        resources :galleries
      end
    end

    # Content
    resources :galleries, only: %i[index show] do
      resources :images, only: %i[create show destroy]
    end
    get 'about_me', to: 'main#about_me', as: 'about_me'
    # Contact form
    resources :contacts, only: [:create]
  end
end
