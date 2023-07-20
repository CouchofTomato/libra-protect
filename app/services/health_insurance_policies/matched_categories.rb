module HealthInsurancePolicies
  class MatchedCategories
    attr_reader :categories, :policies

    def self.match(categories)
      new(categories).match
    end

    def initialize(categories)
      @categories = categories
      @policies = []
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def match
      Insurer.find_each do |insurer|
        insurer.products.each do |product|
          product.core_product_modules.each do |core_product_module|
            all_variations(
              core_product_module,
              grouped_modules(tagged_elective_product_modules(core_product_module))
            ).each do |variation|
              policy = HealthInsurancePolicy.new(
                insurer_id: insurer.id,
                product_id: product.id,
                core_product_module_id: variation[0].id,
                elective_product_module_ids: variation[1..].map(&:id)
              )
              policies.push(policy) if policy.valid_coverage_categories?(categories)
            end
          end
        end
      end
      policies
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    private

    def tagged_elective_product_modules(core_product_module)
      core_product_module.elective_product_modules.tagged_with(categories, any: true)
    end

    def all_variations(core_product_module, grouped_elective_product_modules)
      all_variations = [core_product_module].product(*grouped_elective_product_modules.values)
      all_variations.prepend([core_product_module]) unless all_variations.any? { _1.size == 1 }
      all_variations
    end

    def grouped_modules(product_modules)
      product_modules.group_by(&:category)
    end
  end
end