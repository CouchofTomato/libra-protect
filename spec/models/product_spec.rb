require "rails_helper"

RSpec.describe Product, type: :model do
  subject(:product) { create(:product) }

  # Assocations
  it { expect(product).to belong_to(:insurer) }
  it { expect(product).to have_many(:core_product_modules).dependent(:destroy)}

  # Validations
  it { expect(product).to validate_presence_of :name }
end
