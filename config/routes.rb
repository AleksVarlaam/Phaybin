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
    get '/admin' => redirect("/admins/sign_in")

    root to: 'contents/main#index'
  end
end