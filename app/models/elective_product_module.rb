class ElectiveProductModule < ProductModule
  has_many :linked_product_modules, inverse_of: "elective_product_module", dependent: :destroy
  has_many :core_product_modules, through: :linked_product_modules
end
