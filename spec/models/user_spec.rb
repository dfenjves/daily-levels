require 'spec_helper'

describe User do
	describe "creating a new user" do
		before :each do
	    @user = FactoryGirl.build(:user)
	  end

		it "responds to name" do
			expect(@user).to respond_to(:name)
		end

		it "responds to email" do
			expect(@user).to respond_to(:email)
		end

		it "accepts a new valid user" do
			expect(@user.save).to be_true
		end
		
		describe "username issues" do
			
			it "rejects a new user with no username" do
				@user.name = ""
				expect(@user.save).to be_false
			end

			it "rejects a new user if username already exists" do
			end

			it "rejects a username if it is too long" do
				@user.name = "a" * 31
				expect(@user).to_not be_valid
			end

			it "rejects a username if it is too short" do
				@user.name = "a" * 4
				expect(@user).to_not be_valid
			end

		end

		describe "when email is not given" do
			it "should be invalid" do
				@user.email = ""
				expect(@user).to_not be_valid
			end
		end

		describe "when email format is invalid" do
	    it "should be invalid" do
	      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com]
	      addresses.each do |invalid_address|
	        @user.email = invalid_address
	        expect(@user).not_to be_valid
	      end
	    end
	  end

	  describe "when email format is valid" do
	    it "should be valid" do
	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      addresses.each do |valid_address|
	        @user.email = valid_address
	        expect(@user).to be_valid
	      end
	    end
	  end

	end

end