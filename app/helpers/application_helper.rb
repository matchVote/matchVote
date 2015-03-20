module ApplicationHelper
  def flash_content(key, value)
    unless value.blank? || key == :timedout
      content_tag(:div, value, class: "alert alert-#{flash_type(key)}").html_safe
    end
  end

  def flash_type(key)
    case key
    when "alert" then :warning
    when "notice" then :success
    when "error" then :danger
    end
  end
end
