class HealthPlanComparisonsController < ApplicationController
  def new
    @health_insurance_policy = create_health_insurance_policy
  end

  private

  def health_policy_form_params
    params.fetch(:health_insurance_policy, {})
          .permit(:insurer_id,
                  :product_id,
                  :core_product_module_id,
                  elective_product_module_ids: ProductModule.categories.keys)
  end

  def create_health_insurance_policy
    HealthInsurancePolicy.from_elective_module_ids_hash(health_policy_form_params)
  end
end
