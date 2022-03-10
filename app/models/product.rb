class Product < ApplicationRecord
  belongs_to :insurer
  has_many :core_product_modules, class_name: 'ProductModule', dependent: :destroy

  validates :name, presence: true
end
