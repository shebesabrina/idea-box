FactoryBot.define do
  factory :user do
    sequence(:username){ |n| "user-#{n}"}
    sequence(:password){ |n| "user-#{n}"}
    email 'email@email.com'
  end
end
