# frozen_string_literal: true

class DashboardMenuComponent < ViewComponent::Base
  private

  def current_user
    helpers.current_user
  end
end
