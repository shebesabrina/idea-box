FactoryBot.define do
  factory :user do
    sequence(:username){ |n| "user-#{n}"}
    sequence(:email){ |n| "something#{n}@email.com"}
    password 'password'
  end
end
