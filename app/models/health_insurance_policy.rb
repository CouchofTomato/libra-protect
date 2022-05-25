require "securerandom"

class HealthInsurancePolicy
  include ActiveModel::Model

  attr_accessor :insurer_id, :product_id, :core_product_module_id, :elective_product_module_ids, :id

  class << self
    def from_elective_module_ids_hash(params)
      new(
        insurer_id: params["insurer_id"].to_i,
        product_id: params["product_id"].to_i,
        core_product_module_id: params["core_product_module_id"].to_i,
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
    @core_product_module ||= product.core_product_modules.find_by(id: core_product_module_id)
  end

  def elective_product_modules
    @elective_product_modules ||= core_product_module.elective_product_modules.where(id: elective_product_module_ids)
  end

  def product_module_names
    core_product_module_name.concat(elective_product_module_names)
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

  private

  def core_product_module_name
    [core_product_module.name]
  end

  def elective_product_module_names
    elective_product_modules.map(&:name)
  end
end