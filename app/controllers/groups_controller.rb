# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :check_token, only: :show

  def index
    return redirect_to welcome_index_path unless current_user.present?

    @groups = policy_scope(Group)
  end

  def show
    authorize @group
  end

  def new
    authorize Group.new
  end

  def create
    authorize Group.new

    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = I18n.t('notice.updated')
      redirect_to group_path(@group)
    else
      flash[:error] = @group.errors.full_messages
      render :new
    end
  end

  def edit
    authorize @group
  end

  def update
    authorize @group
  end

  def destroy
    authorize @group
  end

  def join
    group = Group.find_by(token: params[:token])
    if group.present?
      record = Group::User.find_or_create_by(user: current_user, group: group)
      flash[:notice] = I18n.t('group.joined') if record.previously_new_record?
      redirect_to group_path(group)
    else
      flash[:alert] = 'Группа не найдена'
      redirect_to groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :image).merge(author_id: current_user.id)
  end

  def set_group
    @group = Group.find_by(id: params[:id])
    redirect_to root_path, notice: I18n.t('notice.not_found') if @group.blank?
  end

  def check_token
    return if params[:token].blank?
    return if @group.author == current_user

    if params[:token] == @group.token
      Group::User.create(user: current_user, group: @group)
      flash[:notice] = I18n.t('group.joined')
    end
  end
end
