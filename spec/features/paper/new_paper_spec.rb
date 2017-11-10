require 'rails_helper'

describe "New author page", type: :feature do
 
	it "should render without error" do
		visit new_paper_path
	end

	it "should have text input fields for 'title', 'venue;, 'year'" do
		visit new_paper_path 
		expect(page).to have_field('Title')
		expect(page).to have_field('Venue')
		expect(page).to have_field('Year')
	end

	it "should have a submit button" do
		visit new_paper_path
		expect(page).to have_css('input[type="submit"]')
	end
end