class RecommendationsController < ApplicationController
  def new
  end

  def create
    @recommendation = format_coverage_requirements(recommendation_params)
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(coverage_requirements: {})
  end

  def format_coverage_requirements(params)
    params[:coverage_requirements] = params[:coverage_requirements].reject { |_, v| v == "0" }.keys
    params
  end
end
