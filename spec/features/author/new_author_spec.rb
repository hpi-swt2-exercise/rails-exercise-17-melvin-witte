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

	it "should save a new author that is submitted" do
		visit new_author_path
		fill_in('First name', with: 'Alan')
		fill_in('Last name', with: 'Turing')
		fill_in('Homepage', with: 'http://wikipedia.org/Alan_Turing')
		find('input[type="submit"]').click

		author = Author.last
		expect(author.first_name).to eq('Alan')
		expect(author.last_name).to eq('Turing')
		expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
	end	
end