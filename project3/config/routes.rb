Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    #sessions: 'users/sessions',
    registrations: 'users/registrations',
    #passwords: 'users/passwords',
    #confirmations: 'users/confirmations',
    #unlocks: 'users/unlocks',
    #omniauth: 'users/omniauth'
  }

  resources :events do
    resources :rsvps
    resources :users
  end

  resources :users do
    resources :events do
      resources :rsvps
    end
  end

  resources :events_users_data
  resources :rsvps

  root "home#index"

end
