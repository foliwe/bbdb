Rails.application.routes.draw do
  resources :businesses
  devise_for :users, controllers: {registrations: 'user/registrations'}
  root to: 'home#index'
  resources :after_signup ,only: [:show, :update]

end
