# frozen_string_literal: true

Rails.application.routes.draw do
  root 'prospects#new'
  resources :prospects, only: [:create]
end
