Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :users
  end

  resources :users do
    resources :events
  end

  root 'welcome#index'
end
