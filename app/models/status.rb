class Status < ActiveRecord::Base
	validates :dairy, :wheat, :meat, :coffee_cups, presence :true

end