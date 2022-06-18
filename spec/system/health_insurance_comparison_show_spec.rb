require "rails_helper"

RSpec.describe "Health Insurance Comparison Show View" do
  let(:user) { create(:user, email: "dummy@libra.financial") }

  # rubocop:disable Layout/LineLength
  before do
    create(:medical_benefit, name: "Hospital Accomodation", category: "inpatient")
    create(:medical_benefit, name: "Intensive Care", category: "inpatient")
    create(:medical_benefit, name: "Mental Health Treatment", category: "inpatient")
    create(:medical_benefit, name: "Outpatient Surgical Operations", category: "outpatient")
    create(:medical_benefit, name: "Qualified Nurse Treatment", category: "outpatient")
    create(:medical_benefit, name: "Physiotherapy", category: "therapists")
    create(:medical_benefit, name: "Osteopathy", category: "therapists")
    create(:medical_benefit, name: "Evacuation Transport Costs to Nearest Country", 
category: "evacuation_and_repatriation")
    create(:medical_benefit, name: "Accompanying Person Travel Costs", category: "evacuation_and_repatriation")
    create(:medical_benefit, name: "Evacuation Return Journey", category: "evacuation_and_repatriation")
    create(:medical_benefit, name: "Repatriation of Mortal Remains", category: "evacuation_and_repatriation")
    
    create(:insurer, name: "BUPA Global") do |insurer|
      create(:product, name: "Lifeline", insurer: insurer) do |product|
        create(:product_module, :core_product_module, product: product, name: "Gold", sum_assured: "Unlimited", 
category: :core) do |product_module|
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Hospital Accomodation"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Intensive Care"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Mental Health Treatment"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Outpatient Surgical Operations"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Qualified Nurse Treatment"),
                                                  benefit_limit: "Paid in full for up to 15 visits each membership year",
                                                  benefit_limit_status: "capped",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Physiotherapy"),
                                                  benefit_limit: "Paid in full for up to 30 visits each membership year",
                                                  benefit_limit_status: "capped",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Osteopathy"),
                                                  benefit_limit: "Paid in full for up to 30 visits each membership year",
                                                  benefit_limit_status: "capped",
                                                  product_module: product_module)
        end
        create(:product_module, :elective_product_module, product: product, name: "Evacuation", 
sum_assured: "Within Overall Limit", category: :evacuation_and_repatriation) do |product_module|
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Transport Costs to Nearest Country"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accompanying Person Travel Costs"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Return Journey"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
          create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Repatriation of Mortal Remains"),
                                                  benefit_limit: "Paid in full",
                                                  benefit_limit_status: "paid_in_full",
                                                  product_module: product_module)
        end
        create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Gold"),
                                       elective_product_module: ProductModule.find_by(name: "Evacuation"))
      end
    end
    # rubocop:enable Layout/LineLength

    sign_in(user)
    visit root_path
    find(:test_id, "health-comparison-link").click

    find(:test_id, "insurer-select-field").select("BUPA Global")
    find(:test_id, "product-select-field").select("Lifeline")
    page.choose("Gold")
    page.choose("Evacuation")
    find(:test_id, "submit-btn").click
    find(:test_id, "compare-btn").click
  end

  context "with the intitial view" do
    it "displays the comparison table of medical benefits by the default category of inpatient" do
      expect(page).to have_table("inpatient-comparison-table")
    end

    it "displays the inpatient benefit names" do
      expect(page).to have_table("inpatient-comparison-table", with_cols:
        [
          ["Hospital Accomodation", "Intensive Care", "Mental Health Treatment"]
        ])
    end

    it "displays the correct icon for the benefit coverage of the selected product to compare" do
      expect(page).to have_selector("svg[data-test-id='check-circle-outline']", count: 3)
    end

    it "does not display other categories tables" do
      expect(page).not_to have_table("outpatient-comparison-table")
    end
  end

  context "when selecting a different tab" do
    before do
      find(:test_id, "outpatient-tab").click
    end

    it "displays the benefit comparison table for the selected tab" do
      expect(page).to have_table("outpatient-comparison-table")
    end

    it "doesn't display the default table" do
      expect(page).not_to have_table("inpatient-comparison-table")
    end
  end
end
