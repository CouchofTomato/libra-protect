# frozen_string_literal: true

require "rails_helper"

RSpec.describe HealthPolicyComparisonSelectComponent, type: :component do
  subject(:health_policy_comparison_select) { described_class.new(health_insurance_policy: health_policy) }

  let(:insurer) { create(:insurer) }
  let(:product) { create(:product, insurer: insurer) }
  let(:core_product_module) { create(:product_module, :core_product_module, product: product) }

  context "when the health_insurance_policy has no insurer_id" do
    let(:health_policy) { HealthInsurancePolicy.new }

    it "does not render the product select field" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).not_to have_selector "select[data-test-id='product-select-field']"
    end

    it "does not render the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).not_to have_selector "div[data-test-id='core-product-module-fields']"
    end

    it "does not render the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).not_to have_selector "div[data-test-id='elective-product-modules-fields']"
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

      expect(rendered_component).to have_selector "select[data-test-id='product-select-field']"
    end

    it "does not render the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).not_to have_selector "div[data-test-id='core-product-module-fields']"
    end

    it "does not render the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).not_to have_selector "div[data-test-id='elective-product-modules-fields']"
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

      expect(rendered_component).to have_selector "select[data-test-id='product-select-field']"
    end
    
    it "renders the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).to have_selector "div[data-test-id='core-product-module-fields']"
    end

    it "does not render the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).not_to have_selector "div[data-test-id='elective-product-modules-fields']"
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

      expect(rendered_component).to have_selector "select[data-test-id='product-select-field']"
    end
    
    it "renders the core product module radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).to have_selector "div[data-test-id='core-product-module-fields']"
    end

    it "renders the elective product modules radio buttons" do
      render_inline(health_policy_comparison_select)

      expect(rendered_component).to have_selector "div[data-test-id='elective-product-modules-fields']"
    end
  end
end
