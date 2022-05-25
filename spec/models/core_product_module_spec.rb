require "rails_helper"

RSpec.describe CoreProductModule, type: :model do
  subject(:core_product_module) { create(:product_module, :core_product_module) }

  it_behaves_like "A ProductModule class"

  # Associations
  it { expect(core_product_module).to have_many(:linked_product_modules).dependent(:destroy) }
  it { expect(core_product_module).to have_many(:elective_product_modules).through(:linked_product_modules) }
end
