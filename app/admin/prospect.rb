# frozen_string_literal: true

ActiveAdmin.register Prospect do
  menu priority: 1

  permit_params :name, :description, :metadata

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :phone_number
      f.input :email
      f.input :role
      f.input :is_responsible
    end
    f.actions
  end
end
