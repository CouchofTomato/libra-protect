require "rails_helper"

RSpec.describe "Health Insurance Comparison Selection List" do
  let(:user) { create(:user, email: "dummy@libra.financial") }

  before do
    create(:insurer, name: "BUPA Global") do |insurer|
      create(:product, name: "Lifeline", insurer:) do |product|
        create(:product_module, :core_product_module, name: "Gold", product:) do |core_module|
          create(:product_module, :elective_product_module, name: "Evacuation", product:) do |elective_module|
            create(:linked_product_module, core_product_module: core_module,
                                           elective_product_module: elective_module)
          end
        end
      end
    end

    sign_in(user)
    visit root_path
    find(:test_id, "health-comparison-link").click

    find(:test_id, "insurer-select-field").select("BUPA Global")
    find(:test_id, "product-select-field").select("Lifeline")
    page.choose("Gold")
    page.choose("Evacuation")
    find(:test_id, "submit-btn").click
  end

  context "when a Comparison List Card is displayed" do
    it "shows the insurer name" do
      within(find(:test_id, "health-policy-component", match: :first)) do
        expect(page).to have_text "BUPA Global"
      end
    end

    it "shows the product name" do
      within(find(:test_id, "health-policy-component", match: :first)) do
        expect(page).to have_text "Lifeline"
      end
    end

    it "shows the product module names joined with a +" do
      within(find(:test_id, "health-policy-component", match: :first)) do
        expect(page).to have_text "Gold + Evacuation"
      end
    end
  end
end