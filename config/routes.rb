# frozen_string_literal: true

Rails.application.routes.draw do
  root 'report_generations#new'
  resources :report_generations, only: :create
  resources :reports, only: :show do
    member do
      get 'part1', to: 'important_report_obligations#index'
      get 'part2', to: 'minor_report_obligations#index'
      post 'finalisation', to: 'report_finalisations#create'
      get 'dashboard', to: 'report_finalisations#show'
    end
    get 'completed_tasks', to: 'charts#completed_tasks'
    get 'completed_tasks_by_obligation', to: 'charts#completed_tasks_by_obligation'
  end
end
