require 'rails_helper'

RSpec.describe CoreProductModule, type: :model do
  subject(:product_module) { create(:product_module, :core_product_module) }

  it_behaves_like 'A ProductModule class'
end
