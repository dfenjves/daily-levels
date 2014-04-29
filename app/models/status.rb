class Status < ActiveRecord::Base
	validates :dairy, :wheat, :meat, :coffee_cups, :rating, presence: true

end