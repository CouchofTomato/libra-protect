class HealthPlanComparisonsController < ApplicationController
  before_action :reset_comparison_health_policies_session, only: [:new]

  def new
    @health_insurance_policy = create_health_insurance_policy
    @comparison_health_policies = comparison_health_insurance_policies
  end

  def show
    @comparison_health_policies = comparison_health_insurance_policies
    @benefit_categories = MedicalBenefit.categories.keys
    @grouped_benefits = MedicalBenefit.all.group_by(&:category)
    @selected_tab = params[:tab] || "inpatient"
  end

  private

  def reset_comparison_health_policies_session
    session[:comparison_health_policies] = [] if params[:new]
  end

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

  def comparison_health_insurance_policies
    comparison_health_policies.map do |policy|
      HealthInsurancePolicy.new(policy)
    end
  end

  def comparison_health_policies
    session[:comparison_health_policies] ||= []
  end
end
