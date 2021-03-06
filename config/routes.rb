# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :insurers
      resources :products
      resources :core_product_modules
      resources :elective_product_modules
      resources :product_modules
      resources :linked_product_modules
      resources :medical_benefits do
        get :export, on: :collection
      end
      resources :product_module_medical_benefits

      root to: "users#index"
    end

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit",
        :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  root "dashboards#show"

  resource :dashboard, only: [:show]
  resource :health_plan_comparisons, only: [:new, :show]

  namespace :comparisons do
    resources :health_insurance_policies, only: [:create, :destroy]
  end
end
# rubocop:enable Metrics/BlockLength
