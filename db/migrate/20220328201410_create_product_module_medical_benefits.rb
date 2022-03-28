class CreateProductModuleMedicalBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :product_module_medical_benefits do |t|
      t.references :product_module, null: false, foreign_key: true
      t.references :medical_benefit, null: false, foreign_key: true
      t.string :benefit_limit, null: false
      t.integer :benefit_limit_status, null: false
      t.integer :benefit_weighting, default: 0

      t.timestamps
    end
    add_index :product_module_medical_benefits, %i[product_module_id medical_benefit_id],
              unique: true, name: 'index_product_module_benefits_on_product_module_and_benefit'
  end
end
