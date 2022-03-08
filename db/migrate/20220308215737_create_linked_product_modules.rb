class CreateLinkedProductModules < ActiveRecord::Migration[7.0]
  def change
    create_table :linked_product_modules do |t|
      t.integer :core_product_module_id, null: false
      t.integer :elective_product_module_id, null: false

      t.timestamps
    end

    add_foreign_key :linked_product_modules, :product_modules, column: :core_product_module_id
    add_foreign_key :linked_product_modules, :product_modules, column: :elective_product_module_id

    add_index :linked_product_modules, %i[core_product_module_id elective_product_module_id],
              unique: true, name: 'index_linked_product_modules_on_core_and_elective_modules'
  end
end
