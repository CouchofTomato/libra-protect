require "rails_helper"

RSpec.describe MedicalBenefit, type: :model do
  subject(:medical_benefit) { create(:medical_benefit) }

  # Validations
  it { expect(medical_benefit).to validate_presence_of :name }
  it { expect(medical_benefit).to validate_uniqueness_of(:name).case_insensitive.scoped_to(:category) }
  it { expect(medical_benefit).to validate_presence_of :category }

  it do
    expect(medical_benefit).to define_enum_for(:category)
      .with_values(inpatient: 0, outpatient: 1, therapists: 2,
                   medicines_and_appliances: 3, wellness: 4,
                   evacuation_and_repatriation: 5, maternity: 6,
                   dental: 7, optical: 8, additional: 9)
  end
end
