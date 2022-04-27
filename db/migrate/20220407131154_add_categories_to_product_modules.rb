class AddCategoriesToProductModules < ActiveRecord::Migration[7.0]
  def change
    add_column :product_modules, :category, :integer, null: false, default: 0
  end
end
