shared_examples "A ProductModule class" do
  it "belongs to a product" do
    expect(subject).to belong_to(:product)
  end

  it "defines a category enum" do
    expect(subject).to define_enum_for(:category)
      .with_values(core: 0, outpatient: 1, medicines_and_appliances: 2, wellness: 3,
        maternity: 4, dental_and_optical: 5, evacuation_and_repatriation: 6)
  end

  it "has many ProductModuleMedicalBenefits" do
    expect(subject).to have_many(:product_module_medical_benefits).dependent(:destroy)
  end

  it "has many MedicalBenefits through ProductModuleMedicalBenefits" do
    expect(subject).to have_many(:medical_benefits).through(:product_module_medical_benefits)
  end

  it "validates the name scoped to the product and not be case sensitive" do
    expect(subject).to validate_uniqueness_of(:name).case_insensitive.scoped_to(%i[product_id])
  end

  it "validates the presence of type" do
    expect(subject).to validate_presence_of(:type)
  end
end