FactoryGirl.define do
  factory :timeline do
    name "Timeline 1"
    question "How are you?"
    association :user, strategy: :build
  end

end
