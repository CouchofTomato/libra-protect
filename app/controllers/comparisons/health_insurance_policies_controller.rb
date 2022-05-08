module Comparisons
  class HealthInsurancePoliciesController < ApplicationController
    def create
      health_insurance_policy = HealthInsurancePolicy.from_elective_module_ids_hash(health_insurance_policy_params)
      comparison_health_policies << health_insurance_policy.to_h
      redirect_to new_health_plan_comparisons_path
    end

    def destroy
      comparison_health_policies.delete_if { _1["id"] == params[:id] }
  
      respond_to do |format|
        format.html { redirect_to new_health_plan_comparisons_path }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(params[:id]) }
      end
    end

    private

    def health_insurance_policy_params
      params.fetch(:health_insurance_policy, {})
            .permit(:insurer_id,
                    :product_id,
                    :core_product_module_id,
                    elective_product_module_ids: ProductModule.categories.keys)
    end

    def comparison_health_policies
      session[:comparison_health_policies] ||= []
    end
  end
end
