Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :events do
    resources :users
  end

  resources :users do
    resources :events
  end

  resources :users_events_data

  root "home#index"

end