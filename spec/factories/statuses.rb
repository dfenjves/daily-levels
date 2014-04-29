# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status, :class => 'Status' do
  	date "2014-04-08"
  	dairy true
  	wheat true
  	meat true
  	coffee_cups false
  	notes "SomeText"
  	rating 8
  end
end
