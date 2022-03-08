class CreateProductModules < ActiveRecord::Migration[7.0]
  def change
    create_table :product_modules do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
    add_index :product_modules, %i[name product_id], unique: true
  end
end
