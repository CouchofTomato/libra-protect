# This class is a parent to subclasses using STI. It should not be directly instantiated.

class ProductModule < ApplicationRecord
  belongs_to :product

  validates :name, presence: true, uniqueness: { scope: %i[product_id], case_sensitive: false }
  validates :type, presence: true
end
