class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:accept_invitation, keys: [ :first_name, :last_name, :invitation_token ])
  	devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :email, profile_attributes: {}])
  end	
end
