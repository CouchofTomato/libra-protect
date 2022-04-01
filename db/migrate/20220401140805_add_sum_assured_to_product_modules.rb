class AddSumAssuredToProductModules < ActiveRecord::Migration[7.0]
  def change
    add_column :product_modules, :sum_assured, :string, null: false, default: ' '
  end
end
