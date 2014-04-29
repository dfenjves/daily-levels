class Status < ActiveRecord::Base
	validates :dairy, :wheat, :meat, :coffee_cups, :rating, presence: true
	validates :rating, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}
end