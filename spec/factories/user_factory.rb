FactoryBot.define do
  factory :user do
    name { "test"}
    email { "test@example.com" }
    password { User.digest("password") }
  end
end
