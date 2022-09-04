class ProductModuleMedicalBenefitDecorator < SimpleDelegator
  def benefit_limits(options)
    selected_benefit_limits(options)
     .join("\n\n")
     .strip
  end

  private

  def selected_benefit_limits(options)
    arr = [benefit_limit]

    options.each do |option|
      next if option_mapper[option].blank?

      arr.push(option_mapper[option])
    end

    arr
  end

  def option_mapper
    {
      "combined_limits" => combined_limits,
      "module_limits" => product_module.sum_assured
    }
  end
end
