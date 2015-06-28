class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception


=begin
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  hide_action :current_user
=end

# app/controllers/application_controller.rb
	class ApplicationController < ActionController::Base
		before_filter :configure_permitted_parameters, if: :devise_controller?

		protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:user) << :avatar
		end
	end

end
