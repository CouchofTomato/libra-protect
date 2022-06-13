# frozen_string_literal: true

require "rails_helper"

RSpec.describe MedicalBenefitCoverageIconComponent, type: :component do
  subject(:icon) { described_class.new(status: status) }

  context "with a status of paid_in_full" do
    let(:status) { "paid_in_full" }

    it "renders the check circle icon" do
      render_inline(icon)

      expect(page).to have_css "svg[data-test-id='check-circle-outline']"
    end

    it "renders it in green" do
      render_inline(icon)

      expect(page).to have_css ".text-green-600"
    end
  end

  context "with a status of capped" do
    let(:status) { "capped" }

    it "renders the check icon" do
      render_inline(icon)

      expect(page).to have_css "svg[data-test-id='check-outline']"
    end

    it "renders it in green" do
      render_inline(icon)

      expect(page).to have_css ".text-green-600"
    end
  end

  context "with a status of not_covered" do
    let(:status) { "not_covered" }

    it "renders the x icon" do
      render_inline(icon)

      expect(page).to have_css "svg[data-test-id='x-outline']"
    end

    it "renders it in red" do
      render_inline(icon)

      expect(page).to have_css ".text-red-600"
    end
  end
end
