class Status < ActiveRecord::Base
	validates :coffee_cups, :rating, presence: true
	validates :date, presence: true, uniqueness: { :scope => :user_id}
	validates :rating, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}

	belongs_to :user

end