class AddCombinedLimitsToProductModuleMedicalBenefits < ActiveRecord::Migration[7.0]
  def change
    add_column :product_module_medical_benefits, :combined_limits, :string
  end
end
