class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  def check_for_admin
    if !current_user.is_admin?
      respond_to do |format|
        format.html { redirect_to root_path, alert: "Only admins are allowed to interact with #{params[:controller]}!" }
        format.json { render json: {alert: "Only admins are allowed to interact with #{params[:controller]}!"} }
      end
    end
  end

  def authenticate_user_from_token!
    user_api_token = params[:token].presence
    user = user_api_token && User.where(api_auth_token: user_api_token.to_s).first

    if user
      sign_in user, store: false
    end
  end
end
