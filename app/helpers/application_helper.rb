module ApplicationHelper
  include Pagy::Frontend

  def bootstrap_class_for flash_type
    { success: "text-center mb-0  alert-success", error: "text-center mb-0  alert-danger", alert: "text-center mb-0  alert-primary", notice: "text-center mb-0  alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end
end
