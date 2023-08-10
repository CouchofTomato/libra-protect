# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit",
        :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  root "dashboards#show"

  resource :dashboard, only: [:show]

  namespace :comparisons do
    resource :individual_international_health_insurances, only: [:show, :new, :create, :destroy]
  end

  resource :recommendations, only: [:show, :new, :create]
end
