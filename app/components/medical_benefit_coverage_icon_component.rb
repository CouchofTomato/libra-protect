# frozen_string_literal: true

class MedicalBenefitCoverageIconComponent < ViewComponent::Base
  def initialize(status:)
    @status = status
  end

  private

  attr_reader :status

  def icon_name
    coverage_icons.fetch(status)
  end

  def coverage_icons
    {
      "paid_in_full" => "check_circle_outline",
      "capped" => "check_outline",
      "not_covered" => "x_outline"
    }
  end

  def icon_colour
      coverage_colours.fetch(status)
  end

  def coverage_colours
    {
      "paid_in_full" => "text-green-600",
      "capped" => "text-orange-600",
      "not_covered" => "text-red-600"
    }
  end
end
