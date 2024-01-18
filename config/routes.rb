Rails.application.routes.draw do
  # Sets rootpage as the lists index
  root to: 'lists#index'

  # Leave out the edit and update actions for the List Controller
  resources :lists, except: %i[edit update] do
    # Only these routes to create new bookmarks within lists
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: %i[destroy]
  resources :reviews, only: %i[destroy]
end
