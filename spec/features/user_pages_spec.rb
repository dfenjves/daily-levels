require 'spec_helper'

describe "UserPages" do
  
	subject { page }

  describe "signup page" do
    
    before { visit signup_path }
    
    it { should have_content('Sign up') }
    it "should fail if no data is submitted" do
    	expect { click_button "Create my account" }.to_not change(User, :count)
    end

    it "should successfully create user if all data is submitted correctly" do
			fill_in "Name",         with: "Example User"
			fill_in "Email",        with: "user@example.com"
			fill_in "Password",     with: "foobar"
			fill_in "Confirmation", with: "foobar"
			expect { click_button "Create my account" }.to change(User, :count).by(1)
    end

    it "should show a sign out link, success, and user's name upon sign up" do
      fill_in "Name",         with: "Example User 2"
      fill_in "Email",        with: "user2@example.com"
      fill_in "Password",     with: "foobar2"
      fill_in "Confirmation", with: "foobar2"
      click_button "Create my account"
      expect(page).to have_link('Sign out')
      expect(page).to  have_title(user.name)
      expect(page).to  have_selector('div.alert.alert-success', text: 'Welcome')
    end



  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
	  before { visit user_path(user) }

	  it { should have_content(user.name) }
	end

end
