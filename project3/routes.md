                   Prefix Verb   URI Pattern                                                                              Controller#Action
         new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                users/passwords#update
                          PUT    /users/password(.:format)                                                                users/passwords#update
                          POST   /users/password(.:format)                                                                users/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         users/registrations#update
                          PUT    /users(.:format)                                                                         users/registrations#update
                          DELETE /users(.:format)                                                                         users/registrations#destroy
                          POST   /users(.:format)                                                                         users/registrations#create
              event_rsvps GET    /events/:event_id/rsvps(.:format)                                                        rsvps#index
                          POST   /events/:event_id/rsvps(.:format)                                                        rsvps#create
           new_event_rsvp GET    /events/:event_id/rsvps/new(.:format)                                                    rsvps#new
          edit_event_rsvp GET    /events/:event_id/rsvps/:id/edit(.:format)                                               rsvps#edit
               event_rsvp GET    /events/:event_id/rsvps/:id(.:format)                                                    rsvps#show
                          PATCH  /events/:event_id/rsvps/:id(.:format)                                                    rsvps#update
                          PUT    /events/:event_id/rsvps/:id(.:format)                                                    rsvps#update
                          DELETE /events/:event_id/rsvps/:id(.:format)                                                    rsvps#destroy
              event_users GET    /events/:event_id/users(.:format)                                                        users#index
                          POST   /events/:event_id/users(.:format)                                                        users#create
           new_event_user GET    /events/:event_id/users/new(.:format)                                                    users#new
          edit_event_user GET    /events/:event_id/users/:id/edit(.:format)                                               users#edit
               event_user GET    /events/:event_id/users/:id(.:format)                                                    users#show
                          PATCH  /events/:event_id/users/:id(.:format)                                                    users#update
                          PUT    /events/:event_id/users/:id(.:format)                                                    users#update
                          DELETE /events/:event_id/users/:id(.:format)                                                    users#destroy
                   events GET    /events(.:format)                                                                        events#index
                          POST   /events(.:format)                                                                        events#create
                new_event GET    /events/new(.:format)                                                                    events#new
               edit_event GET    /events/:id/edit(.:format)                                                               events#edit
                    event GET    /events/:id(.:format)                                                                    events#show
                          PATCH  /events/:id(.:format)                                                                    events#update
                          PUT    /events/:id(.:format)                                                                    events#update
                          DELETE /events/:id(.:format)                                                                    events#destroy
         user_event_rsvps GET    /users/:user_id/events/:event_id/rsvps(.:format)                                         rsvps#index
                          POST   /users/:user_id/events/:event_id/rsvps(.:format)                                         rsvps#create
      new_user_event_rsvp GET    /users/:user_id/events/:event_id/rsvps/new(.:format)                                     rsvps#new
     edit_user_event_rsvp GET    /users/:user_id/events/:event_id/rsvps/:id/edit(.:format)                                rsvps#edit
          user_event_rsvp GET    /users/:user_id/events/:event_id/rsvps/:id(.:format)                                     rsvps#show
                          PATCH  /users/:user_id/events/:event_id/rsvps/:id(.:format)                                     rsvps#update
                          PUT    /users/:user_id/events/:event_id/rsvps/:id(.:format)                                     rsvps#update
                          DELETE /users/:user_id/events/:event_id/rsvps/:id(.:format)                                     rsvps#destroy
              user_events GET    /users/:user_id/events(.:format)                                                         events#index
                          POST   /users/:user_id/events(.:format)                                                         events#create
           new_user_event GET    /users/:user_id/events/new(.:format)                                                     events#new
          edit_user_event GET    /users/:user_id/events/:id/edit(.:format)                                                events#edit
               user_event GET    /users/:user_id/events/:id(.:format)                                                     events#show
                          PATCH  /users/:user_id/events/:id(.:format)                                                     events#update
                          PUT    /users/:user_id/events/:id(.:format)                                                     events#update
                          DELETE /users/:user_id/events/:id(.:format)                                                     events#destroy
                    users GET    /users(.:format)                                                                         users#index
                          POST   /users(.:format)                                                                         users#create
                 new_user GET    /users/new(.:format)                                                                     users#new
                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                     user GET    /users/:id(.:format)                                                                     users#show
                          PATCH  /users/:id(.:format)                                                                     users#update
                          PUT    /users/:id(.:format)                                                                     users#update
                          DELETE /users/:id(.:format)                                                                     users#destroy
        users_events_data GET    /users_events_data(.:format)                                                             users_events_data#index
                          POST   /users_events_data(.:format)                                                             users_events_data#create
   new_users_events_datum GET    /users_events_data/new(.:format)                                                         users_events_data#new
  edit_users_events_datum GET    /users_events_data/:id/edit(.:format)                                                    users_events_data#edit
       users_events_datum GET    /users_events_data/:id(.:format)                                                         users_events_data#show
                          PATCH  /users_events_data/:id(.:format)                                                         users_events_data#update
                          PUT    /users_events_data/:id(.:format)                                                         users_events_data#update
                          DELETE /users_events_data/:id(.:format)                                                         users_events_data#destroy
                     root GET    /                                                                                        home#index