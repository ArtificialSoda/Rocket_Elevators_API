Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :elevators
  resources :batteries
  resources :customers
  resources :addresses

  resources :columns
  resources :building_details
  resources :buildings

  resource :quotes
  resource :leads

  resource :employees

  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  #admin_root ''

  # GET routes
  get 'quote' => 'quotes#quote'
  get 'corporate' => 'pages#corporate'
  get 'residential' => 'pages#residential'
  get 'index' => 'pages#index'
  get 'admin_root' => 'elevators#index'

  # POST routes

  post 'quote/create' => 'quotes#create'
  post 'contact/create' => 'leads#create'
end

