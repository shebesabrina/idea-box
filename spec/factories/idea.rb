FactoryBot.define do
  factory :idea do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    category
    user
  end
end
