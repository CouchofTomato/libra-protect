FactoryBot.define do
  factory :product_module do
    name { 'MyString' }
    product
    type { '' }
    sum_assured { 'USD 1,000,000 | GBP 600,000 | EUR 750,000' }

    trait :core_product_module do
      type { 'CoreProductModule' }
    end

    trait :elective_product_module do
      type { 'ElectiveProductModule' }
    end

    initialize_with { type.present? ? type.constantize.new : ProductModule.new }
  end
end
