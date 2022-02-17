class Product < ApplicationRecord
  belongs_to :insurer

  validates :name, presence: true
end
