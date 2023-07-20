FactoryBot.define do
  factory :product_module do
    name { "MyString" }
    product
    type { "" }
    sum_assured { "USD 1,000,000 | GBP 600,000 | EUR 750,000" }
    category { 0 }

    trait :core_product_module do
      type { "CoreProductModule" }
    end

    trait :elective_product_module do
      type { "ElectiveProductModule" }
    end

    trait :with_coverage_categories do
      transient do
        coverage_categories { nil }
      end

      after(:create) do |product_module, evaluator| 
        product_module.update(coverage_category_list: evaluator.coverage_categories)
      end
    end
    
    initialize_with { type.present? ? type.constantize.new : ProductModule.new }
  end
end
