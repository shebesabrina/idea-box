FactoryBot.define do
  factory :admin do
    sequence(:username){ |n| "user-#{n}"}
    sequence(:email){ |n| "something#{n}@email.com"}
    password 'password'
    role 1
  end
end
