module Comparisons
  class HealthInsurancePoliciesController < ApplicationController
    def create
      @health_insurance_policy = HealthInsurancePolicy.from_elective_module_ids_hash(health_insurance_policy_params)

      if @health_insurance_policy.valid?
        comparison_health_policies << @health_insurance_policy.to_h
        redirect_to new_health_plan_comparisons_path
      else
        flash.now['alert'] = @health_insurance_policy.errors.full_messages.join('</br>')
        @comparison_health_policies = comparison_health_insurance_policies
        render "health_plan_comparisons/new", status: :unprocessable_entity
      end
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

    def comparison_health_insurance_policies
      comparison_health_policies.map do |policy|
        HealthInsurancePolicy.new(policy)
      end
    end
  end
end
