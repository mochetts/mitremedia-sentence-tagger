Rails.application.routes.draw do
  resources :entity_types
  root 'sentences#index'

  resources :sentences, only: %i[index show create]

  resources :entities, only: %i[create]
end
