FactoryGirl.define do

  factory :user do
    transient do
      skip_confirmation true
    end

    sequence(:email) { |n| "user#{n}@example.com" }
    name "test name"
    password  "test password"

    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end
  end
end
