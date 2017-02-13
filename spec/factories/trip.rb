FactoryGirl.define do
  factory :trip do
    association :user, factory: :user
    association :event, factory: :event
    association :event, factory: :event
    name "Fun Trip"
  end
end
