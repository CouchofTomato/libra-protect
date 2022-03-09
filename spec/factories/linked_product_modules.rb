FactoryBot.define do
  factory :linked_product_module do
    core_product_module { association :product_module, :core_product_module }
    elective_product_module { association :product_module, :elective_product_module }
  end
end
