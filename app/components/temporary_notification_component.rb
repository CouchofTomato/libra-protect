# frozen_string_literal: true

class TemporaryNotificationComponent < ViewComponent::Base
  def initialize(type:, message:)
    @type = type
    @message = message
  end

  def type_icon
    {
      alert: "icons/x_circle_outline",
      notice: "icons/check_circle_outline"
    }.fetch(@type.to_sym)
  end

  def type_class
    {
      alert: "h-6 w-6 text-red-400",
      notice: "h-6 w-6 text-green-400"
    }.fetch(@type.to_sym)
  end
end
