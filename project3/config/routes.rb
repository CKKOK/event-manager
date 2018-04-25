Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
