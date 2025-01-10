# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :assert_path_allowed

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[login email first_name surname])
  end

  def assert_path_allowed
    redirect_to guests_path unless token.present?
  end

  def token
    cookies[:jwt_token].presence || (token_verification && fetch_token[:value])
  end

  def token_verification
    JWT.decode(params[:token], ENV.fetch('JWT_SECRET', nil))
  rescue StandardError
    false
  end

  def fetch_token
    cookies[:jwt_token] = { value: params[:token], expires: 3.months.from_now }
  end

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
