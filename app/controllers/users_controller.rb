# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    redirect_to root_path, notice: I18n.t('notice.add_question') if @user.blank?
  end

  def edit; end

  def update
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
end
