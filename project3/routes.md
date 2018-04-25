                   Prefix Verb   URI Pattern                                                                              Controller#Action
         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
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
   event_user_datum_index GET    /event_user_datum(.:format)                                                              event_user_datum#index
                          POST   /event_user_datum(.:format)                                                              event_user_datum#create
     new_event_user_datum GET    /event_user_datum/new(.:format)                                                          event_user_datum#new
    edit_event_user_datum GET    /event_user_datum/:id/edit(.:format)                                                     event_user_datum#edit
         event_user_datum GET    /event_user_datum/:id(.:format)                                                          event_user_datum#show
                          PATCH  /event_user_datum/:id(.:format)                                                          event_user_datum#update
                          PUT    /event_user_datum/:id(.:format)                                                          event_user_datum#update
                          DELETE /event_user_datum/:id(.:format)                                                          event_user_datum#destroy
                    rsvps GET    /rsvps(.:format)                                                                         rsvps#index
                          POST   /rsvps(.:format)                                                                         rsvps#create
                 new_rsvp GET    /rsvps/new(.:format)                                                                     rsvps#new
                edit_rsvp GET    /rsvps/:id/edit(.:format)                                                                rsvps#edit
                     rsvp GET    /rsvps/:id(.:format)                                                                     rsvps#show
                          PATCH  /rsvps/:id(.:format)                                                                     rsvps#update
                          PUT    /rsvps/:id(.:format)                                                                     rsvps#update
                          DELETE /rsvps/:id(.:format)                                                                     rsvps#destroy
                     root GET    /                                                                                        home#index
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
