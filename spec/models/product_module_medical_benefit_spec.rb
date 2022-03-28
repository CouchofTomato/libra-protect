require 'rails_helper'

RSpec.describe ProductModuleMedicalBenefit, type: :model do
  subject(:product_module_medical_benefit) { create(:product_module_medical_benefit) }

  # Associations
  it { expect(product_module_medical_benefit).to belong_to :product_module }
  it { expect(product_module_medical_benefit).to belong_to :medical_benefit }

  # Validations
  it { expect(product_module_medical_benefit).to validate_presence_of :benefit_limit }
  it { expect(product_module_medical_benefit).to validate_presence_of :benefit_limit_status }


  it do
    expect(product_module_medical_benefit).to define_enum_for(:benefit_limit_status)
      .with_values(paid_in_full: 0, capped: 1)
  end

  it 'starts with a default value of 0 for the benefit_weighting attribute' do
    expect(described_class.new.benefit_weighting).to eq 0
  end
end
