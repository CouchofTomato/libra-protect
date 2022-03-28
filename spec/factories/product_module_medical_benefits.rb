FactoryBot.define do
  factory :product_module_medical_benefit do
    association :product_module, :core_product_module
    medical_benefit
    benefit_limit { 'MyString' }
    benefit_limit_status { 'paid_in_full' }
    benefit_weighting { 0 }
  end
end
