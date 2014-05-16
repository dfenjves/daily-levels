require 'spec_helper'

describe User do

	before :each do
    @user = FactoryGirl.build(:user)
  end
  
	it "accepts a new valid user" do
		puts @user.name
	end

	it "rejects a new user with no username" do
	end

	it "rejects a new user with no email" do
	end

	it "rejects a new user if username already exists" do
	end

end
