Rails.application.routes.draw do
  get "*path", to: 'short_link#resolve_link'
  resources :short_link, only: [:create]
end
