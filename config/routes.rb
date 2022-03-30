# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :insurers
      resources :products
      resources :core_product_modules
      resources :elective_product_modules
      resources :linked_product_modules
      resources :medical_benefits
      resources :product_module_medical_benefits

      root to: 'users#index'
    end
  devise_for :users, skip: [:registrations]

  root 'dashboards#show'

  resource :dashboard, only: [:show]

  as :user do
    get 'users/edit' => 'devise/registrations#edit',
        :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
end
