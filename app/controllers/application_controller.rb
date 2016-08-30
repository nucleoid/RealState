class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def check_for_admin
    if !current_user.is_admin?
      respond_to do |format|
        format.html { redirect_to root_path, alert: "Only admins are allowed to modify users!" }
        format.json { render json: {alert: "Only admins are allowed to modify users!"} }
      end
    end
  end
end
