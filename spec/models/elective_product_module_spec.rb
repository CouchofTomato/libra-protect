require "rails_helper"

RSpec.describe ElectiveProductModule, type: :model do
  subject(:elective_product_module) { create(:product_module, :elective_product_module) }

  it_behaves_like "A ProductModule class"

  # Associations
  it { expect(elective_product_module).to have_many(:linked_product_modules).dependent(:destroy) }
  it { expect(elective_product_module).to have_many(:core_product_modules).through(:linked_product_modules) }
end
