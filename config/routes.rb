Rails.application.routes.draw do
  # Sets rootpage as the lists index
  root to: 'lists#index'

  # Leave out the edit and update actions for the List Controller
  resources :lists, except: %i[edit update] do
    # Only these routes to create new bookmarks within list show view
    resources :bookmarks, only: %i[new create]
    # Only this route to create a review within the list show view
    resources :reviews, only: :create
  end
  # Separate these outside of the nest to create simpler paths to the roots
  # E.g.: [/lists/:id] [/bookmarks/:id] [/reviews/:id] => DELETE
  resources :bookmarks, only: %i[destroy]
  resources :reviews, only: %i[destroy]
end
