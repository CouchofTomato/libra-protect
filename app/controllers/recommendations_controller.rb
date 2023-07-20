class RecommendationsController < ApplicationController
  before_action :reset_recommendation_health_policies_session, only: [:new]

  def show
    @recommendation_health_policies = recommendation_health_insurance_policies
  end

  def new
  end

  def create
    @matched_products = HealthInsurancePolicies::MatchedCategories.match(
      format_coverage_requirements(recommendation_params[:coverage_requirements])
    )
    @matched_products.each do |product|
      recommendation_health_policies << product.to_h
    end

    redirect_to recommendations_path
  end

  private

  def reset_recommendation_health_policies_session
    session[:recommendation_health_policies] = nil
  end

  def recommendation_params
    params.require(:recommendation).permit(coverage_requirements: {})
  end

  def format_coverage_requirements(params)
    params.reject { |_, v| v == "0" }.keys
  end

  def recommendation_health_policies
    session[:recommendation_health_policies] ||= []
  end

  def recommendation_health_insurance_policies
    recommendation_health_policies.map do |policy|
      HealthInsurancePolicy.new(policy)
    end
  end
end
