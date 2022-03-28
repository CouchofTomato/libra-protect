# This class is a parent to subclasses using STI. It should not be directly instantiated.

class ProductModule < ApplicationRecord
  belongs_to :product

  has_many :product_module_medical_benefits, dependent: :destroy
  has_many :medical_benefits, through: :product_module_medical_benefits

  validates :name, presence: true, uniqueness: { scope: %i[product_id], case_sensitive: false }
  validates :type, presence: true
end
