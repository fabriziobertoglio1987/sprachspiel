class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
	  buildings_path
	end

	private

	def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :gold => 100, :wood => 100, :food => 100, :stone => 100, :metal => 100]) 
  	devise_parameter_sanitizer.permit(:account_update, keys: [:email, :gold => 100, :wood => 100, :food => 100, :stone => 100, :metal => 100]) 
	end  		

end
