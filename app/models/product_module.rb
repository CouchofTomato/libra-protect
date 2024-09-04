# This class is a parent to subclasses using STI. It should not be directly instantiated.

class ProductModule < ApplicationRecord
  belongs_to :product

  has_many :product_module_medical_benefits, dependent: :destroy
  has_many :medical_benefits, through: :product_module_medical_benefits

  acts_as_taggable_on :coverage_categories

  enum :category, { core: 0, outpatient: 1, medicines_and_appliances: 2, wellness: 3,
    maternity: 4, dental_and_optical: 5, evacuation_and_repatriation: 6, travel: 7 }

  validates :name, presence: true, uniqueness: { scope: %i[product_id], case_sensitive: false }
  validates :type, presence: true
  
  validate :coverage_categories_are_valid

  accepts_nested_attributes_for :product_module_medical_benefits, allow_destroy: true

  private

  def coverage_categories_are_valid
    coverage_category_list.each do |coverage_category|
      unless valid_coverage_categories.include?(coverage_category)
        errors.add(:coverage_categories, "#{coverage_category} is not a valid coverage category")
      end
    end
  end

  #rubocop:disable Metrics/MethodLength
  def valid_coverage_categories
    %w[
      inpatient
      outpatient
      therapists
      medicines_and_appliances
      wellness
      maternity
      dental
      optical
      evacuation
      repatriation
    ]
  end
  #rubocop:enable Metrics/MethodLength
end
