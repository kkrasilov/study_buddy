# frozen_string_literal: true

module ApplicationHelper
  def flash_type(name)
    case name
    when 'notice' then 'info'
    when 'alert' then 'error'
    else name
    end
  end
end
