# frozen_string_literal: true

module Recommendations
  class HealthPolicyComparisionSelectionListComponent < ViewComponent::Base
    with_collection_parameter :health_insurance_policy

    def initialize(health_insurance_policy:)
      @health_insurance_policy = health_insurance_policy
    end
  end
end
