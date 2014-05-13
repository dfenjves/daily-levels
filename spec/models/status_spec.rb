require 'spec_helper'

describe Status do

	before :each do
    @status = FactoryGirl.build(:status)
  end
	
	it "saves a valid status update" do
		expect(@status.save).to be_true
	end
	
	describe "fails if attributes are missing" do

		it "fails save if missing coffee_cups" do
			@status.coffee_cups = nil
			expect(@status.save).to be_false
		end

		it "fails save if missing rating" do
			@status.rating = nil
			expect(@status.save).to be_false
		end
	end

	it "fails save if rating is above 10" do
		@status.rating = 11
		expect(@status.save).to be_false
	end

	it "fails save if rating is below 0" do
		@status.rating = -2
		expect(@status.save).to be_false
	end

end
