class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_default_response_format
  before_action :authenticate_user_from_token!,  if: :token_check?
  before_action :authenticate_user!, if: :session_check?

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
    elsif api_only?
      render json: {error: 'You need a valid token before continuing.'}, status: :unauthorized and return
    end
  end

  def set_default_response_format
    if api_only?
      request.format = :json
    elsif html_only?
      request.format = :html
    end
  end

  def token_check?
    api_only? || api_and_html?
  end

  def session_check?
    html_only? || api_and_html?
  end

  def api_only?
    ENV['REAL_STATE_APP_TYPE'] == 'API'
  end

  def html_only?
    ENV['REAL_STATE_APP_TYPE'] == 'HTML'
  end

  def api_and_html?
    !['API', 'HTML'].include?(ENV['REAL_STATE_APP_TYPE'])
  end
end
