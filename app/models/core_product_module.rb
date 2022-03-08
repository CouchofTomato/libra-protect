class CoreProductModule < ProductModule
  has_many :linked_product_modules, inverse_of: 'core_product_module', dependent: :destroy
  has_many :elective_product_modules, through: :linked_product_modules
end
