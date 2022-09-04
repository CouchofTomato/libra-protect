class NullProductModuleMedicalBenefit
  def benefit_limit_status
    "not_covered"
  end

  def benefit_limit
    "Not Covered"
  end

  def combined_limits
    ""
  end

  def product_module
    NullProductModule.new
  end
end
