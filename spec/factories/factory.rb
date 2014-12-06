FactoryGirl.define do
  factory :user do
    name "John"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
  end

end
