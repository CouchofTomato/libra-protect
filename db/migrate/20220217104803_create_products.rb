class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, name: false
      t.references :insurer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
