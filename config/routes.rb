# frozen_string_literal: true

Rails.application.routes.draw do
  root 'report_generations#new'
  resources :report_generations, only: :create
  resources :reports, only: :show do
    resources :finalisation, controller: :report_finalisations, only: :create
    resources :part1, controller: :important_report_obligations, only: :index
    resources :part2, controller: :minor_report_obligations, only: :index
  end
end
