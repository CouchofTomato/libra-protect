# frozen_string_literal: true

class HealthPolicyComparisonSelectComponent < ViewComponent::Base
  def initialize(health_insurance_policy:)
    @health_insurance_policy = health_insurance_policy
  end

  private

  attr_reader :health_insurance_policy

  def products_viewable
    health_insurance_policy.insurer
  end

  def core_product_modules_viewable
    products_viewable && health_insurance_policy.product
  end

  def elective_product_modules_viewable
    core_product_modules_viewable &&       health_insurance_policy.core_product_module&.elective_product_modules&.any?
  end

  def active_elective_product_module_categories
    @health_insurance_policy.core_product_module.elective_product_modules.map(&:category).uniq
  end

  def selected_elective_product_module(module_id)
    return unless @health_insurance_policy.elective_product_module_ids

    @health_insurance_policy.elective_product_module_ids.include?(module_id)
  end
end
