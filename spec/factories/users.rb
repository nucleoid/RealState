# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'test@user.com'
    confirmed_at '2016-08-31'
    password 'password'
    role Role.find_key(:customer_user)

    factory :admin do
      email 'admin@user.com'
      role Role.find_key(:admin)
    end
  end
end
