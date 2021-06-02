FactoryBot.define do
  sequence :email do |n|
    "factory_#{n}@example.com"
  end

  factory :user do
    email { 'factory_1@example.com' }
    password { 'Password' }
    password_confirmation { 'Password' }
    role { 'admin' }
    after :build do |u|
      u.email = FactoryBot.generate(:email)
    end
  end
end
