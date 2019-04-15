FactoryBot.define do
  factory :user do
    _account = Faker::Internet.username
    sequence(:account) { |n| "#{n}_#{_account}" }
    name { Faker::Name.name }
    sequence(:email) { |n| Faker::Internet.username("#{n}_#{_account}") }
  end
end
