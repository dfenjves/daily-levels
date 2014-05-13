require 'spec_helper'

describe "Statuses" do

  describe "Creating a status" do

    it "should add a new status and show the status on the index page" do
    	visit(new_status_path)
    	fill_in('status[date]', :with => Time.now.strftime("%Y-%m-%d"))
    	check('status[wheat]')
    	check('status[dairy]')
    	fill_in('Cups', :with => 2)
    	fill_in('Rating', :with => 7)
    	fill_in('Notes', :with => "It was a pretty good day")
    	click_button('Create Status')
    	expect(page).to have_content(7)
    end

  end

end
