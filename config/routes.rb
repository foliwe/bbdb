Rails.application.routes.draw do
  get '/business_profile/:id', to: 'users#business_profile', as: "business_profile"
  resources :businesses do 
    resources :reviews 
    resources :photos do
      match '/remove', to: 'businesses#remove', via: 'delete'
     end 
  end
  devise_for :users, controllers: {registrations: 'user/registrations'}
  root to: 'home#index'
  resources :after_signup ,only: [:show, :update]

end
