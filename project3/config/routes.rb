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
  
  get 'events/:event_id/rsvps/export', :to => 'rsvps#export', :as => 'export_event_rsvps'
  get 'events/:event_id/rsvps/edit', :to => 'rsvps#edit', :as => 'edit_user_event_rsvp_list'
  get 'events/:event_id/attendance', :to => 'events#attendance', :as => 'event_attendance_list'
  get 'users/:user_id/events/:event_id/rsvps/export', :to => 'rsvps#export', :as => 'export_user_event_rsvps'
  get 'users/:user_id/events/:event_id/rsvps/edit', :to => 'rsvps#edit'
  get 'users/:user_id/events/:event_id/attendance', :to => 'events#attendance', :as => 'user_event_attendance_list'
  patch 'events_users_data/:id/update_attendance', :to => 'events_users_data#mark_attendance', :as => 'events_users_datum_update_attendance'
  post 'events/:event_id/attendancescan', :to => 'events#attendance_scan', :as => 'event_attendance_scan'

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
