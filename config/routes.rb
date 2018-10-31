Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :emails
  namespace :api  do
    get 'emails', to: 'emails#index'
  end
end
