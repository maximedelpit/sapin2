# frozen_string_literal: true

Rails.application.routes.draw do
  root 'report_generations#new'
  resources :report_generations, only: :create
  resources :reports, only: :show
end
