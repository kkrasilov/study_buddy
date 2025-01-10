# frozen_string_literal: true

module ApplicationHelper
  def flash_type(name)
    case name
    when 'notice' then 'info'
    when 'alert' then 'error'
    else name
    end
  end

  def default_avatar_name(user)
    user.male? ? 'images/default_avatar.png' : 'images/default_avatar_female.png'
  end
end
