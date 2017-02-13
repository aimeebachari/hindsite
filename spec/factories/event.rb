FactoryGirl.define do
  factory :event do
    association :user, factory: :user
    sequence(:name) { |n| "user#{n}" }
    sequence(:date) { |n| "177#{n}" }
    sequence(:address) { |n| "123#{n} Summer St. Boston, MA 0211#{n}" }
    description "A historical place."
  end
end
