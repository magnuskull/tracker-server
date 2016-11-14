FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User Name #{n}" }
  end
end
