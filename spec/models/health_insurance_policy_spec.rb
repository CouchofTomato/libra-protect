require 'rails_helper'

RSpec.describe HealthInsurancePolicy, type: :model do
  describe '.from_elective_module_ids_hash' do
    let(:params) do
      {
        insurer_id: 1,
        product_id: 2,
        core_product_module_id: 1,
        elective_product_module_ids: elective_product_module_ids
      }
    end

    context 'with elective_product_module_ids in the params argument' do
      let(:elective_product_module_ids) { { 'core' => 1, 'outpatient' => 2, 'wellness' => '' } }

      it 'converts an elective_modules_id hash to an array of values with blanks removed' do
        expect(described_class.from_elective_module_ids_hash(params).elective_product_module_ids)
          .to eq [1, 2]
      end
    end
    
    context 'without elective_product_module_ids in the params argument' do
      let(:elective_product_module_ids) { nil }

      it 'sets the elective_product_module_ids argument to nil' do
        expect(described_class.from_elective_module_ids_hash(params).elective_product_module_ids)
          .to be_nil
      end      
    end
  end
end