require "rails_helper"

RSpec.describe NullProductModuleMedicalBenefit do
  subject(:null_product_module_medical_benefit) { described_class.new }
  
  let(:status) { "not_covered" }

  describe "#benefit_limit_status" do
    it "returns not_covered" do
      expect(null_product_module_medical_benefit.benefit_limit_status).to eq status
    end
  end
end