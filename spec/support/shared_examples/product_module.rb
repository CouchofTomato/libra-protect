shared_examples 'A ProductModule class' do
  it 'belongs to a product' do
    expect(subject).to belong_to(:product)
  end

  it 'validates the name scoped to the product and not be case sensitive' do
    expect(subject).to validate_uniqueness_of(:name).case_insensitive.scoped_to(%i[product_id])
  end

  it 'validates the presence of type' do
    expect(subject).to validate_presence_of(:type)
  end
end