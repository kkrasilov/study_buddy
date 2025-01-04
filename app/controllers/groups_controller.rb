# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    redirect_to welcome_index_path unless current_user.present?
  end
end
