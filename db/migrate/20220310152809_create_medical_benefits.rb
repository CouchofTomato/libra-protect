class CreateMedicalBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_benefits do |t|
      t.string :name, null: false
      t.integer :category, null: false

      t.timestamps
    end
    add_index :medical_benefits, %i[name category], unique: true
  end
end
