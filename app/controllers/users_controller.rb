# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def show
    @user = User.find(params[:id])

    authorize @user

    redirect_to root_path, notice: I18n.t('notice.add_question') if @user.blank?
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: I18n.t('notice.updated')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :surname, :avatar, :country, :city, :institution, :profession,
                                 :gender)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path, notice: I18n.t('notice.not_found') if @user.blank?
  end
end
