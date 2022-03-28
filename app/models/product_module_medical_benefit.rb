class ProductModuleMedicalBenefit < ApplicationRecord
  belongs_to :product_module
  belongs_to :medical_benefit

  enum benefit_limit_status: { paid_in_full: 0, capped: 1 }

  validates :benefit_limit, presence: true
  validates :benefit_limit_status, presence: true
end
