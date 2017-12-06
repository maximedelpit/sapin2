# frozen_string_literal: true

Rails.application.routes.draw do
  root 'report_generations#new'
  resources :report_generations, only: :create
  resources :report_completions, only: :create
  resources :reports, only: :show do
    resources :completion1, controller: :important_report_obligations, only: :index
    resources :completion2, controller: :minor_report_obligations, only: :index
  end
end
