Seatyourself::Application.routes.draw do

  root :to => 'restaurants#index'

  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :restaurants do
    resources :reservations 
  end 
  resources :reservations
end
