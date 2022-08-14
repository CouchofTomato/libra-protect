require "securerandom"

class HealthInsurancePolicy
  include ActiveModel::Model

  attr_accessor :insurer_id, :product_id, :core_product_module_id, :elective_product_module_ids, :id

  validates :insurer_id, presence: true
  validates :product_id, presence: true
  validates :core_product_module_id, presence: true

  class << self
    def from_elective_module_ids_hash(params)
      new(
        insurer_id: params["insurer_id"],
        product_id: params["product_id"],
        core_product_module_id: params["core_product_module_id"],
        elective_product_module_ids: elective_ids_from_hash(params["elective_product_module_ids"]),
        id: params["id"]
      )
    end

    private

    def elective_ids_from_hash(elective_ids_hash)
      return unless elective_ids_hash

      elective_ids_hash
        .values
        .compact_blank
        .map(&:to_i)
    end
  end

  def initialize(params = {})
    super(params)
    @id ||= SecureRandom.uuid
  end

  def insurer
    @insurer ||= Insurer.find_by(id: insurer_id)
  end

  def product
    @product ||= insurer.products.find_by(id: product_id)
  end

  def core_product_module
    @core_product_module ||= product.core_product_modules
                                    .includes(product_module_medical_benefits: :medical_benefit)
                                    .find_by(id: core_product_module_id)
  end

  def elective_product_modules
    @elective_product_modules ||= core_product_module.elective_product_modules
                                                     .includes(product_module_medical_benefits: :medical_benefit)
                                                     .where(id: elective_product_module_ids)
  end

  def product_modules
    [core_product_module].concat(elective_product_modules)
  end

  def product_module_names
    product_modules.map(&:name)
  end

  def to_h
    {
      id: id,
      insurer_id: insurer_id,
      product_id: product_id,
      core_product_module_id: core_product_module_id,
      elective_product_module_ids: elective_product_module_ids
    }
  end

  def product_module_medical_benefits
    product_modules.flat_map(&:product_module_medical_benefits)
  end

  def product_module_medical_benefit(benefit_id)
    match = matching_benefits(benefit_id)
    if match.any?
      match.max_by(&:benefit_weighting)
    else
      NullProductModuleMedicalBenefit.new
    end
  end

  def overall_sum_assured
    core_product_module.sum_assured
  end

  private

  def matching_benefits(benefit_id)
    product_module_medical_benefits.select { |medical_benefit| medical_benefit.medical_benefit.id == benefit_id }
  end
end