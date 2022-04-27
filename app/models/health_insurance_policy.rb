class HealthInsurancePolicy
  include ActiveModel::Model

  attr_accessor :insurer_id, :product_id, :core_product_module_id, :elective_product_module_ids

  class << self
    def from_elective_module_ids_hash(params)
      new(
        insurer_id: params[:insurer_id].to_i,
        product_id: params[:product_id].to_i,
        core_product_module_id: params[:core_product_module_id].to_i,
        elective_product_module_ids: elective_ids_from_hash(params[:elective_product_module_ids])
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
end