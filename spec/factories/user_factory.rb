FactoryGirl.define do
  factory :user do
    name 'test'
    sequence(:email) { |n| "user#{n}@example.com" }
    password "testpass"
    password_confirmation "testpass"
  end
end
