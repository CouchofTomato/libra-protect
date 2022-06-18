require "rails_helper"

RSpec.describe HealthInsurancePolicy, type: :model do
  describe ".from_elective_module_ids_hash" do
    let(:params) do
      {
        "insurer_id" => 1,
        "product_id" => 2,
        "core_product_module_id" => 1,
        "elective_product_module_ids" => elective_product_module_ids,
        "id" => "123"
      }
    end

    context "with elective_product_module_ids in the params argument" do
      let(:elective_product_module_ids) { { "core" => 1, "outpatient" => 2, "wellness" => "" } }

      it "converts an elective_modules_id hash to an array of values with blanks removed" do
        expect(described_class.from_elective_module_ids_hash(params).elective_product_module_ids)
          .to eq [1, 2]
      end
    end
    
    context "without elective_product_module_ids in the params argument" do
      let(:elective_product_module_ids) { nil }

      it "sets the elective_product_module_ids argument to nil" do
        expect(described_class.from_elective_module_ids_hash(params).elective_product_module_ids)
          .to be_nil
      end      
    end
  end

  context "with an id provided in the params" do
    let(:params) do
      {
        "insurer_id" => 1,
        "product_id" => 2,
        "core_product_module_id" => 1,
        "elective_product_module_ids" => [1, 2, 3],
        "id" => id
      }
    end
    let(:id) { "12345-6789" }

    it "sets the id to that passed in" do
      expect(described_class.new(params).id).to eq id
    end
  end

  context "without an id provided in the params" do
    let(:params) do
      {
        "insurer_id" => 1,
        "product_id" => 2,
        "core_product_module_id" => 1,
        "elective_product_module_ids" => [1, 2, 3],
      }
    end
    let(:uuid) { "98765-4321" }

    before do
      allow(SecureRandom).to receive(:uuid).and_return uuid
    end

    it "sets the id to a random UUID" do
      expect(described_class.new(params).id).to eq uuid
    end
  end

  describe "#product_module_benefit_benefit" do
    subject(:health_insurance_policy) { described_class.new(params) }

    let(:params) do
      {
        "insurer_id" => 1,
        "product_id" => 2,
        "core_product_module_id" => 1,
        "elective_product_module_ids" => [2],
        "id" => "1234"
      }
    end
    let(:product_module_medical_benefit) { ProductModuleMedicalBenefit.find(1) }

    before do
      create(:insurer, id: 1) do |insurer|
        create(:product, id: 2, insurer: insurer) do |product|
          create(:product_module, :core_product_module, id: 1, product: product) do |core_product_module|
            create(:medical_benefit, id: 1) do |medical_benefit|
              create(:product_module_medical_benefit, id: 1,
                                                      product_module: core_product_module,
                                                      medical_benefit: medical_benefit)
            end
            create(:product_module, :elective_product_module, id: 2, name: "Evacuation", 
product: product) do |elective_product_module|
              create(:linked_product_module, core_product_module: core_product_module,
                                             elective_product_module: elective_product_module)
            end
          end
        end
      end
    end

    context "when the health insurance policy does cover the benefit" do
      it "returns the matching ProductModuleMedicalBenefit" do
        expect(health_insurance_policy.product_module_medical_benefit(1)).to eq product_module_medical_benefit
      end
    end

    context "when the health insurance policy does not cover the benefit" do
      it "returns a NullProductModuleMedicalBenefit" do
        expect(health_insurance_policy.product_module_medical_benefit(3)).to be_a NullProductModuleMedicalBenefit
      end
    end
  end

  describe "#product_module_names" do
    subject(:health_insurance_policy) { described_class.new(params) }

    let(:params) do
      {
        "insurer_id" => 1,
        "product_id" => 2,
        "core_product_module_id" => 1,
        "elective_product_module_ids" => [2],
        "id" => "1234"
      }
    end
    let(:product_module_medical_benefit) { ProductModuleMedicalBenefit.find(1) }

    before do
      create(:insurer, id: 1) do |insurer|
        create(:product, id: 2, insurer: insurer) do |product|
          create(:product_module, :core_product_module, id: 1, name: "Gold", product: product) do |core_product_module|
            create(:medical_benefit, id: 1) do |medical_benefit|
              create(:product_module_medical_benefit, id: 1,
                                                      product_module: core_product_module,
                                                      medical_benefit: medical_benefit)
            end
            create(:product_module, :elective_product_module, id: 2, name: "Evacuation", 
product: product) do |elective_product_module|
              create(:linked_product_module, core_product_module: core_product_module,
                                             elective_product_module: elective_product_module)
            end
          end
        end
      end
    end

    it "maps the product module names into an array" do
      expect(health_insurance_policy.product_module_names).to eq ["Gold", "Evacuation"]
    end
  end
end
