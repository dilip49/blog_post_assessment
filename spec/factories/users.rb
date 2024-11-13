FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    role { "requester" }
  end

  factory :admin, class: 'User' do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    admin { "admin" }
  end
end

