require 'rails_helper'

describe "New author page", type: :feature do
 
	it "should render withour error" do
		visit new_author_path
	end

	it "should have text input fields for 'first name', 'last name, 'homepage'" do
		visit new_author_path 
		expect(page).to have_field('First name')
		expect(page).to have_field('Last name')
		expect(page).to have_field('Homepage')
	end

	it "should have a submit button" do
		visit new_author_path
		expect(page).to have_css('input[type="submit"]')
	end
end