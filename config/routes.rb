# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root 'dashboard#show'

  resource :dashboard, only: [:show]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
end
