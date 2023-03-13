Rails.application.routes.draw do
  devise_for :admins, controllers: { 
    registrations: 'admins/registrations', sessions: 'admins/sessions'
  }

  root to: 'main#index'
end
