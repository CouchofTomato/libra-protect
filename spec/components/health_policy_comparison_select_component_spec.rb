# frozen_string_literal: true

require "rails_helper"

RSpec.describe HealthPolicyComparisonSelectComponent, type: :component do
  subject(:health_policy_comparison_select) { described_class.new(health_insurance_policy: health_policy) }

  let(:insurer) { create(:insurer) }
  let(:product) { create(:product, insurer:) }
  let(:core_product_module) { create(:product_module, :core_product_module, product:) }
  let(:elective_product_module) { create(:product_module, :elective_product_module, name: 'elective', product:) }

  context "when the health_insurance_policy has no insurer_id" do
    let(:health_policy) { HealthInsurancePolicy.new }

    it "does not render the product select field" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_select "select[data-test-id='product-select-field']"
    end

    it "does not render the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_css "div[data-test-id='core-product-module-fields']"
    end

    it "does not render the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_css "div[data-test-id='elective-product-modules-fields']"
    end
  end

  context "when the health_insurance_policy has an insurer_id" do
    let(:health_policy) do
      HealthInsurancePolicy.new(
        insurer_id: insurer.id
      )
    end

    it "renders the product select field" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_css("select[data-test-id='product-select-field']")
    end

    it "does not render the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_css "div[data-test-id='core-product-module-fields']"
    end

    it "does not render the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_css "div[data-test-id='elective-product-modules-fields']"
    end
  end

  context "when the health_insurance_policy has an insurer_id and product_id" do
    let(:health_policy) do
      HealthInsurancePolicy.new(
        insurer_id: insurer.id,
        product_id: product.id
      )
    end

    it "renders the product select field" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_css("select[data-test-id='product-select-field']")
    end
    
    it "renders the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_css "div[data-test-id='core-product-module-fields']"
    end

    it "does not render the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_css "div[data-test-id='elective-product-modules-fields']"
    end
  end

  context "when the health_insurance_policy has an insurer_id, product_id and core_product_module_id" do
    let(:health_policy) do
      HealthInsurancePolicy.new(
        insurer_id: insurer.id,
        product_id: product.id,
        core_product_module_id: core_product_module.id
      )
    end

    it "renders the product select field" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_css("select[data-test-id='product-select-field']")
    end
    
    it "renders the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_css "div[data-test-id='core-product-module-fields']"
    end
  end

  context "when the health insurance policy does not have any elective product modules" do
    let(:health_policy) do
      HealthInsurancePolicy.new(
        insurer_id: insurer.id,
        product_id: product.id,
        core_product_module_id: core_product_module.id,
        elective_product_module_ids: []
      )
    end

    it "does not render the elective product modules label" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_no_content "Elective Product Modules"
    end
  end

  context "when the health insurance policy has elective product modules" do
    let(:health_policy) do
      HealthInsurancePolicy.new(
        insurer_id: insurer.id,
        product_id: product.id,
        core_product_module_id: core_product_module.id,
        elective_product_module_ids: [elective_product_module.id]
      )
    end

    before do
      create(:linked_product_module, core_product_module:, elective_product_module:)
    end

    it "renders the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(page).to have_css "div[data-test-id='elective-product-modules-fields']"
    end
  end
end
