require 'rails_helper'

RSpec.describe Insurer, type: :model do
  subject(:insurer) { create(:insurer) }

  it { expect(insurer).to have_many(:products).dependent(:destroy) }
  it { expect(insurer).to validate_presence_of :name }
end
