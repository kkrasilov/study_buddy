# frozen_string_literal: true

class UsersController < ApplicationController
  def profile
    redirect_to new_user_session_path, notice: I18n.t('notice.need_sign_in') if current_user.blank?
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to profile_users_path, notice: I18n.t('notice.updated')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :surname, :avatar, :country, :city, :institution, :profession)
  end
end
