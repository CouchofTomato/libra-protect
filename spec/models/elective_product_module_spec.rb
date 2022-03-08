require 'rails_helper'

RSpec.describe ElectiveProductModule, type: :model do
  subject(:product_module) { create(:product_module, :elective_product_module) }

  it_behaves_like 'A ProductModule class'
end
