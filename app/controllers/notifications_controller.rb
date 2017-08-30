
class NotificationsController < ApplicationController

  def index
    @notifications_unread = current_user.notifications.unread
    @notifications_read = current_user.notifications.read
  end

  def change_status
    Notification.find(params[:id]).change_status!
    respond_to do |format|
      format.html { redirect_to notifications_path unless request.xhr? }
      format.js
    end
  end

  def destroy
  end

end
