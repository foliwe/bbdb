Rails.application.routes.draw do
  get 'contact/new'
  namespace :admin do
      resources :users
      resources :business_categories
      resources :addresses
      resources :policies
      resources :histories
      resources :reviews
      resources :categories
      resources :businesses
      #resources :likes
      resources :roles
      root to: "users#index"
    end
      resources :contacts, only: [:new, :create]
  #get 'edit_user/:id', to: 'users#edit', as: "edit_user"
  resources :businesses ,except: [:edit] do 
    scope module: :businesses do 
      resources :likes, only: [:create, :destroy]
    end
    resources :business_wizard ,controller:'businesses/business_wizard'
    resources :reviews 
    resources :photos do
      match '/remove', to: 'businesses#remove', via: 'delete'
    end 
  end
  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions'}
  resources :users
  get '/business_profile/:id', to: 'users#business_profile', as: "business_profile"
  root to: 'businesses#index'
  resources :after_signup ,only: [:show, :update]
  get 'help', to: "home#help"
  get 'index', to: "home#index"
  get 'general', to: "home#general"
  get 'bill', to: "home#bill"
  get 'assistance', to: "home#assistance"
  get 'deals', to: "home#deals"
  get 'devices', to: "home#devices"
  get 'events', to: "home#events"
  get 'techsupport', to: "home#techsupport"
  get 'footerpage', to: "home#footerpage"
  get 'ppolicy', to: "home#ppolicy"
  get 'terms_of_use', to: "home#terms_of_use"
  get 'aboutus', to: "home#aboutus"
  get 'partnerships', to: "home#partnerships"
  get 'affiliates', to: "home#affiliates"
  get 'careers', to: "home#careers"
end


