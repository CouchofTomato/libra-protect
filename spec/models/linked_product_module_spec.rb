require 'rails_helper'

RSpec.describe LinkedProductModule, type: :model do
  subject(:linked_product_module) { create(:linked_product_module) }

  # Assocations
  it { expect(linked_product_module).to belong_to(:core_product_module).class_name('ProductModule') }
  it { expect(linked_product_module).to belong_to(:elective_product_module).class_name('ProductModule') }

  # Validations
  it do
    expect(linked_product_module).to(
      validate_uniqueness_of(:core_product_module_id).scoped_to(:elective_product_module_id)
    )
  end
end
