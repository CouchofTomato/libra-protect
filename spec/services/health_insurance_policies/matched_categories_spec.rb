require 'rails_helper'

RSpec.describe HealthInsurancePolicies::MatchedCategories do
  before do
    create(:insurer, id: 1) do |insurer|
      create(:product, id: 2, insurer:) do |product|
        create(:product_module, :core_product_module, :with_coverage_categories, id: 1, name: "Essential",
                 product:, coverage_categories: ["inpatient", "evacuation"]) do |core_product_module|
          create(:product_module, :elective_product_module, :with_coverage_categories, id: 2, name: "Evacuation", 
                   product:, coverage_categories: ["evacuation"]) do |elective_product_module|
            create(:linked_product_module, core_product_module:, elective_product_module:)
          end
        end
      end
    end

    create(:insurer, id: 10) do |insurer|
      create(:product, id: 20, insurer:) do |product|
        create(:product_module, :core_product_module, :with_coverage_categories, id: 10, name: "Classic",
                 product:, coverage_categories: ["inpatient", "outpatient"]) do |core_product_module|
          create(:product_module, :elective_product_module, :with_coverage_categories, id: 20, name: "Evacuation", 
                   product:, coverage_categories: ["evacuation"]) do |elective_product_module|
            create(:linked_product_module, core_product_module:, elective_product_module:)
          end
        end
      end
    end
  end

  describe '.match' do
    context 'when only inpatient coverage is required' do
      let(:categories) { ['inpatient'] }

      it 'returns health insurance policies that cover inpatient' do
        expect(described_class.match(categories)).to include(
          an_object_having_attributes(insurer_id: 1, core_product_module_id: 1)
        )
      end

      it 'does not return a health insurance policy with outpatient coverage' do
        expect(described_class.match(categories)).not_to include(
          an_object_having_attributes(insurer_id: 10)
        )
      end
    end

    context 'when outpatient coverage is required' do
      let(:categories) { ['inpatient', 'outpatient'] }

      it 'returns health insurance policies that cover outpatient' do
        expect(described_class.match(categories)).to include(
          an_object_having_attributes(insurer_id: 10)
        )
      end

      it 'does not return a health insurance policy with no outpatient coverage' do
        expect(described_class.match(categories)).not_to include(
          an_object_having_attributes(insurer_id: 1)
        )
      end
    end

    context 'when an elective module does not contain a required coverage category' do
      let(:categories) { ['inpatient'] }

      it 'does not include the elective module' do
        expect(described_class.match(categories)).not_to include(
          an_object_having_attributes(elective_product_module_ids: [2])
        )
      end
    end

    context 'when both a core module and an elective module both contain a required coverage category' do
      let(:categories) { ['inpatient', 'evacuation'] }

      it 'includes a health insurance policy with only the core module covered' do
        expect(described_class.match(categories)).to include(
          an_object_having_attributes(core_product_module_id: 1, elective_product_module_ids: [])
        )
      end

      it 'includes a health insurance policy with both the core module and elective module covered' do
        expect(described_class.match(categories)).to include(
          an_object_having_attributes(core_product_module_id: 1, elective_product_module_ids: [2])
        )
      end
    end
  end
end