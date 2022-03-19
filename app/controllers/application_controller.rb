class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top, :about, :info]
  #before_action :configure_permitted_parameters, if: :devise_controller?
end
