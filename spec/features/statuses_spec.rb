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
      expect(page).to have_content("Successfully created new daily status")
    end

    it "should raise an error if a status exists with the same date" do
      visit(new_status_path)
      fill_in('status[date]', :with => (Time.now-86400).strftime("%Y-%m-%d"))
      check('status[wheat]')
      check('status[dairy]')
      fill_in('Cups', :with => 2)
      fill_in('Rating', :with => 7)
      fill_in('Notes', :with => "It was a pretty good day")
      click_button('Create Status')

      visit(new_status_path)
      fill_in('status[date]', :with => (Time.now-86400).strftime("%Y-%m-%d"))
      check('status[meat]')
      check('status[dairy]')
      fill_in('Cups', :with => 4)
      fill_in('Rating', :with => 3)
      fill_in('Notes', :with => "This shouldn't work")
      click_button('Create Status')

      expect(page).to have_content("You already have a daily status for the selected date.")
    end

    it "should raise an error if coffee cups are not filled out" do
      visit(new_status_path)
      fill_in('status[date]', :with => Time.now.strftime("%Y-%m-%d"))
      check('status[wheat]')
      check('status[dairy]')
      fill_in('Rating', :with => 7)
      fill_in('Notes', :with => "Didn't fill out coffee")
      click_button('Create Status')
      expect(page).to have_content("Please add coffee consumption")

    end

    it "should raise an error if daily rating level is not filled out" do
      visit(new_status_path)
      fill_in('status[date]', :with => Time.now.strftime("%Y-%m-%d"))
      check('status[wheat]')
      check('status[dairy]')
      fill_in('Cups', :with => 4)
      fill_in('Notes', :with => "Didn't fill out rating")
      click_button('Create Status')
      expect(page).to have_content("Please add a daily rating")
    end

  end

end
