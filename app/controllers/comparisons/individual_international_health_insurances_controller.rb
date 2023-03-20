module Comparisons
  class IndividualInternationalHealthInsurancesController < ApplicationController
    before_action :reset_comparison_health_policies_session, only: [:new]
    before_action :set_benefit_view_options, only: [:show]

    def show
      @comparison_health_policies = comparison_health_insurance_policies
      @benefit_categories = MedicalBenefit.categories.keys
      @grouped_benefits = active_benefits.group_by(&:category)
      @selected_tab = params[:tab] || "inpatient"
  
      respond_to do |format|
        format.html
        format.xlsx do
          response.headers["Content-Disposition"] = 'attachment; filename="comparison.xlsx"'
        end
      end
    end

    def new
      @health_insurance_policy = create_health_insurance_policy
      @comparison_health_policies = comparison_health_insurance_policies
    end

    def create
      @health_insurance_policy = create_health_insurance_policy

      if @health_insurance_policy.valid?
        comparison_health_policies << @health_insurance_policy.to_h
        redirect_to new_comparisons_individual_international_health_insurances_path
      else
        flash.now['alert'] = @health_insurance_policy.errors.full_messages.join('</br>')
        @comparison_health_policies = comparison_health_insurance_policies
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      comparison_health_policies.delete_if { _1[:id] == params[:id] }
  
      respond_to do |format|
        format.html { redirect_to new_health_plan_comparisons_path }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(params[:id]) }
      end
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

    def comparison_health_insurance_policies
      comparison_health_policies.map do |policy|
        HealthInsurancePolicy.new(policy)
      end
    end

    def comparison_health_policies
      session[:comparison_health_policies] ||= []
    end

    def reset_comparison_health_policies_session
      session[:comparison_health_policies] = [] if params[:new]
    end

    def set_benefit_view_options
      @benefit_view_options = params['benefit_view_options']
        .reject { |_, v| v == "0" }.keys if params['benefit_view_options']
    end

    def active_benefits
      return MedicalBenefit.all unless params[:benefit_view_options]
  
      benefits = MedicalBenefit.all
      benefits = benefits.where(id: active_benefit_ids) if params["benefit_view_options"]["active_benefits"] == "1"
      benefits
    end
  
    def active_benefit_ids
      @comparison_health_policies
        .map(&:product_module_medical_benefits)
        .flatten
        .map(&:medical_benefit_id)
        .uniq
    end
  end
end
