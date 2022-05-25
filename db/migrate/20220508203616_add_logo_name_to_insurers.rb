class AddLogoNameToInsurers < ActiveRecord::Migration[7.0]
  def change
    add_column :insurers, :logo_name, :string, default: 'icons/office_building_outline.svg'
  end
end
