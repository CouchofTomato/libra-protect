FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password { 'foobar' }
    admin { false }

    factory :admin_user do
      admin { true }
    end
  end
end