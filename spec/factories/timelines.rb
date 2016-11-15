FactoryGirl.define do
  factory :timeline do
    name "Timeline 1"
    association :user, strategy: :build
  end

end
