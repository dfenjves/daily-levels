# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Username"
    email "user@user.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
