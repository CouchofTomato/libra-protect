FactoryBot.define do
  factory :product_module do
    name { 'MyString' }
    product
    type { '' }

    trait :core_product_module do
      type { 'CoreProductModule' }
    end

    trait :elective_product_module do
      type { 'ElectiveProductModule' }
    end

    initialize_with { type.present? ? type.constantize.new : ProductModule.new }
  end
end
