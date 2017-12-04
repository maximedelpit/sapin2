# frozen_string_literal: true

# Parent controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
