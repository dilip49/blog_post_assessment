FactoryBot.define do
  factory :post do
    title { "Sample Blog Post" }
    content { "This is a sample blog post content." }
    status { "pending" }
    association :user
  end
end