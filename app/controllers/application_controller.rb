# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :assert_path_allowed

  def assert_path_allowed
    redirect_to guests_path unless token.present?
  end

  def token
    cookies[:jwt_token].presence || (token_verification && fetch_token[:value])
  end

  def token_verification
    JWT.decode(params[:token], ENV['JWT_SECRET'])
  rescue StandardError
    false
  end

  def fetch_token
    cookies[:jwt_token] = { value: params[:token], expires: 3.months.from_now }
  end
end
