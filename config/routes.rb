Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :business_categories
      resources :addresses
      resources :policies
      resources :reviews
      resources :categories
      resources :businesses
      resources :likes
      resources :roles
      
      

      root to: "users#index"
    end
  #get 'edit_user/:id', to: 'users#edit', as: "edit_user"
  resources :businesses do 
    resources :business_wizard ,controller:'businesses/business_wizard'
    resources :reviews 
    resources :photos do
      match '/remove', to: 'businesses#remove', via: 'delete'
    end 
  end
  devise_for :users, controllers: {registrations: 'user/registrations'}
  resources :users
  get '/business_profile/:id', to: 'users#business_profile', as: "business_profile"
  root to: 'businesses#index'
  resources :after_signup ,only: [:show, :update]
  get 'help', to: "home#help"
end
