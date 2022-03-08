class LinkedProductModule < ApplicationRecord
  belongs_to :core_product_module, class_name: 'ProductModule'
  belongs_to :elective_product_module, class_name: 'ProductModule'

  validates :core_product_module_id, uniqueness: { scope: :elective_product_module_id }
end
