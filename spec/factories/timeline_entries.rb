FactoryGirl.define do
  factory :timeline_entry do
    value 1
    association :timeline, strategy: :build
  end

end
