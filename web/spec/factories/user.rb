FactoryBot.define do
  sequence :email do |i|
    "taro#{i}@example.com"
  end

  factory :user do
    name { '山田太郎' }
    email { generate :email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
