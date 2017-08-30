class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :unread_notifications, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def unread_notifications
    @notifications = current_user.notifications.unread.reverse_order
    @notifications_number = current_user.notifications.unread.count
  end

  def after_sign_in_path_for(resource)
    studies_path
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :school_number, :photo, :photo_cache, :phone_number, :address, :type, :mayor_id])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :photo_cache, :address, :phone_number])
  end
end
