class Product < ApplicationRecord
  belongs_to :insurer
  has_many :core_product_modules, dependent: :destroy

  validates :name, presence: true
end
