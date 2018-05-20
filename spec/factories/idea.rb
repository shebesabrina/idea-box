FactoryBot.define do
  factory :idea do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Title #{n}" }
    # image
    # category
  end
end
