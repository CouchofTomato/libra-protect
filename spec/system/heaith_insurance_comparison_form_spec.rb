require "rails_helper"

RSpec.describe "Health Insurance Comparison Form" do
  let(:user) { create(:user, email: "dummy@libra.financial") }

  before do
    create(:insurer, name: "BUPA Global") do |insurer|
      create(:product, name: "Lifeline", insurer: insurer) do |product|
        create(:product_module, :core_product_module, name: "Gold", product: product) do |core_module|
          create(:product_module, :elective_product_module, name: "Evacuation", product: product) do |elective_module|
            create(:linked_product_module, core_product_module: core_module,
                                           elective_product_module: elective_module)
          end
        end
      end
    end

    sign_in(user)
    visit root_path
    find(:test_id, "health-comparison-link").click
  end

  it "does not display the product select if an insurer has been selected" do
    expect(page).not_to have_select("select[data-test-id='product-select-field']")
  end

  it "displays the product select if an insurer has been selected" do
    find(:test_id, "insurer-select-field").select("BUPA Global")

    expect(page).to have_select do |select|
      select.has_selector? "select[data-test-id='product-select-field']"
    end
  end

  it "does not display the core product module radio buttons if a product has not been selected" do
    expect(page).not_to have_selector("div[data-test-id='core-product-module-fields']")
  end

  it "displays the core product module radio buttons if a product has been selected" do
    find(:test_id, "insurer-select-field").select("BUPA Global")
    find(:test_id, "product-select-field").select("Lifeline")

    expect(page).to have_selector("div[data-test-id='core-product-module-fields']")
  end

  it "does not display the elective product module radio buttons if a core product module has not been selected" do
    expect(page).not_to have_selector("div[data-test-id='elective-product-modules-fields']")
  end

  it "displays the elective product module radio buttons if a core product module has not been selected" do
    find(:test_id, "insurer-select-field").select("BUPA Global")
    find(:test_id, "product-select-field").select("Lifeline")
    page.choose("Gold")

    expect(page).to have_selector("div[data-test-id='elective-product-modules-fields']")
  end
end