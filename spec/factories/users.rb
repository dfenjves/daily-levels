# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Danny Fenjves"
    email "danny@user.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
